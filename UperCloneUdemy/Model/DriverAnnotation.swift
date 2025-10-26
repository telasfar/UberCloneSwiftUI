//
//  DriverAnnotation.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 25/10/2025.
//

import Foundation
import MapKit
import Firebase

class DriverAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    let uid:String
    
    init(driver:User) {
        self.coordinate = CLLocationCoordinate2D(latitude: driver.coordinates.latitude, longitude: driver.coordinates.longitude)
        self.uid = driver.uid
    }
}
