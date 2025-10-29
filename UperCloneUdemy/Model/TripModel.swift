//
//  TripModel.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 29/10/2025.
//

import Foundation
import Firebase

struct TripModel:Identifiable, Codable{
    let id:String
    let passengerID:String
    let driverID:String
    let passengerName:String
    let driverName:String
    let driverlocation:GeoPoint
    let passengerLocation:GeoPoint
    let pickUpLocation:GeoPoint
    let dropOffLocation:GeoPoint
    let pickupLocationName:String
    let dropOffLocationName:String
    let pickupLocationAddress:String
    let tripCost:Double
}
