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
    
    func makeUIView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator //elcontext dah zay el self
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
    }
    
    func makeCoordinator() -> MapCoordinator {//swiftui is calling that funstion..methay2ly feha feha ben3mel implemnts lel delegates ely ben7taga lel swiftui
        MapCoordinator(parent: self)//lazem 2a7ded coordinator we dah zay el self dah bas beytabasa lel swiftui
    }
}

extension UberMabViewRepresntable{
    class MapCoordinator:NSObject,MKMapViewDelegate{//el fekra hena en UberMabViewRepresntable haykon leh access lel MKMapViewDelegate
        let parent:UberMabViewRepresntable//to communicate with the UberMabViewRepresntable from here
        
        init(parent:UberMabViewRepresntable) {
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            parent.mapView.setRegion(region, animated: true)//men el parent ely shayel mapview ha3melo setRegion
        }
        
        
    }
}
