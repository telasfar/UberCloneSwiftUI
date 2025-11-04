//
//  TripModel.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 29/10/2025.
//

import Foundation
import Firebase
import FirebaseFirestore

struct TripModel:Identifiable, Codable{
    @DocumentID var id:String?//@DocumentID automatically assign el documentID el parent lel child beta3aha fayeb2o related le ba3d
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
    var distnceToPassenger:String?
    var travelTime:Int?
    var state:TripState
}//7'od balak en el data ely hate7tagaha 3ashan te fill el struct dah hata7'od shewaya men el AuthVM we showaya men el locationVM

enum TripState:Int,Codable{//hayet3amlo encode fe el DB we el Int 3ashan hayet7'azen keda fe el firestore (as Int)
    case requested//to show loading indeicator
    case accepted
    case rejected
}
