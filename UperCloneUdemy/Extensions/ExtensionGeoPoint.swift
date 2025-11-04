//
//  ExtensionGeoPoint.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 04/11/2025.
//

import Firebase
import MapKit

extension GeoPoint {
    var toCoordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: CLLocationDegrees(self.latitude),
            longitude: CLLocationDegrees(self.longitude)
        )
    }
}
