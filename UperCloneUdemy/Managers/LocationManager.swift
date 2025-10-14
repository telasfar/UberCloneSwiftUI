//
//  LocationManager.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 09/10/2025.
//

import CoreLocation

class LocationManager:NSObject,ObservableObject{//7at el ObservableObject 3ashan hay3mel publisher
    
    private let locationManager = CLLocationManager()
    static let shared = LocationManager()//hayeb2a Singelton 3ashan hay3ozo fe aktar men makan fe el Appp
    @Published var userLocation:CLLocationCoordinate2D?// 3amlo published 3ashan yefdal ye emmit el user location tol mahwa beyt3'ayar
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
}

extension LocationManager:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return}
        self.userLocation = location.coordinate
        locationManager.stopUpdatingLocation()//7at deh 3ashan law wa2ef we mafesh ta3'yeer fe el location mayefdalsh ye update
    }
}
