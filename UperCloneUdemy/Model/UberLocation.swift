//
//  UberLocation.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 14/10/2025.
//

import CoreLocation

struct UberLocation: Identifiable{
    let title: String//hay3oz el title dah fe el RideREquestView
    let coordinate: CLLocationCoordinate2D
    let id = UUID().uuidString
}
