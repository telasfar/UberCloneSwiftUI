//
//  LocationManager.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 09/10/2025.
//

import CoreLocation

class LocationManager:NSObject,ObservableObject{//7at el ObservableObject 3ashan hay3mel publisher
    
    private let locationManager = CLLocationManager()
    
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
        guard locations.count > 0 else {return}
        locationManager.stopUpdatingLocation()//7at deh 3ashan law wa2ef we mafesh ta3'yeer fe el location mayefdalsh ye update
    }
}
