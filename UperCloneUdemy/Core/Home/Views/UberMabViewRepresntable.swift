//
//  UberMabViewRepresntable.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 08/10/2025.
//

import SwiftUI
import MapKit

struct UberMabViewRepresntable:UIViewRepresentable{//dah protocol lel uikit integration fe el swiftui
    let mapView = MKMapView()
    let locationManager = LocationManager()//hanupdate meno el location
    @EnvironmentObject var viewModel: LoactionSearchVM//nafs instance el viewModel ely ma3molha inject fe el APP we shayla nafs el data men LocationSearchView..HWA HENA BEYLISTEN LEL VM CHANGES
    
    @Binding var mapState: MapViewState
    
    func makeUIView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator //elcontext dah zay el self
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {//beytnada 3ala el func deh ma3a kol update lel view
        
        switch mapState{
        case .noInput:
            context.coordinator.clearAndCenterMapview()
        case .searchingLocation:
            break
        case .locationSelected:
            if let selectedLocationCoordinate = viewModel.selectedLocationCoordinate{
                context.coordinator.addAndSelectAnnotation(coordinate: selectedLocationCoordinate)
                context.coordinator.configurePlyline(distenationCoordinates: selectedLocationCoordinate)
            }
        }
    }
    
    func makeCoordinator() -> MapCoordinator {//swiftui is calling that funstion..methay2ly feha feha ben3mel implemnts lel delegates ely ben7taga lel swiftui
        MapCoordinator(parent: self)//lazem 2a7ded coordinator we dah zay el self dah bas beytabasa lel swiftui
    }
}

extension UberMabViewRepresntable{
    class MapCoordinator:NSObject,MKMapViewDelegate{//el fekra hena en UberMabViewRepresntable haykon leh access lel MKMapViewDelegate
        let parent:UberMabViewRepresntable//to communicate with the UberMabViewRepresntable from here
        var userLocationCoordinate:CLLocationCoordinate2D?
        var currentRegion:MKCoordinateRegion?//hasta7'demo 3ashan 2a3mel center lel mapview 3ala elmakan ely kont feh
        
        init(parent:UberMabViewRepresntable) {
            self.parent = parent
            super.init()
        }
        
        func addAndSelectAnnotation(coordinate:CLLocationCoordinate2D) {
            parent.mapView.removeAnnotations(parent.mapView.annotations)//hayshel ay annotaion men el map abl may7ot geded
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            parent.mapView.addAnnotation(annotation)
            parent.mapView.selectAnnotation(annotation, animated: true)
            parent.mapView.showAnnotations(parent.mapView.annotations, animated: true)
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            userLocationCoordinate = userLocation.coordinate
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            currentRegion = region//to set the region
            parent.mapView.setRegion(region, animated: true)//men el parent ely shayel mapview ha3melo setRegion
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: any MKOverlay) -> MKOverlayRenderer {
            let polyline = MKPolylineRenderer(overlay: overlay)
            polyline.strokeColor = .blue
            polyline.lineWidth = 5
            return polyline
        }
        
        func getDestinationRoute(
            from userLocation:CLLocationCoordinate2D,
            to destinationLocation:CLLocationCoordinate2D,
            complition: @escaping (MKRoute) -> Void){
                let userPlaceMark = MKPlacemark(coordinate: userLocation)
                let destinationPlaceMark = MKPlacemark(coordinate: destinationLocation)
                let request = MKDirections.Request()
                request.source = MKMapItem(placemark: userPlaceMark)
                request.destination = MKMapItem(placemark: destinationPlaceMark)
                request.transportType = .automobile
                let directions = MKDirections(request: request)
                directions.calculate() { (response, error) in
                    guard let route = response?.routes.first else { return }
                    complition(route)
                }
         }
        
        func configurePlyline(distenationCoordinates:CLLocationCoordinate2D){
            guard let userLocationCoordinate = userLocationCoordinate else{return}
            getDestinationRoute(from: userLocationCoordinate, to: distenationCoordinates) { route in
                self.parent.mapView.addOverlay(route.polyline)
            }
        }
        
        func clearAndCenterMapview(){
            parent.mapView.removeOverlays(parent.mapView.overlays)
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            if let currentRegion = currentRegion{
                parent.mapView.setRegion(currentRegion, animated: true)
            }
        }
        
    }
   
}

