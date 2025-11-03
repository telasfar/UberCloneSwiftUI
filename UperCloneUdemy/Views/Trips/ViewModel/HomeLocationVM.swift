//
//  HomeLocationVM.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 31/10/2025.
//

import SwiftUI
import Firebase
import MapKit

class HomeLocationVM: ObservableObject {//will try to use shared model layer here in HomeLocationVM instade of combine LoactionSearchVM with HomeViewModel
    @EnvironmentObject var locationVM: LoactionSearchVM
    @EnvironmentObject var homeVM: HomeViewModel
}

//as a driver
extension HomeLocationVM{
    
}

//as a passenger
extension HomeLocationVM{
    
    func getPlaceMark(location:CLLocation, complition: @escaping (CLPlacemark?,Error?) -> Void){
        CLGeocoder().reverseGeocodeLocation(location){ plcaeMarksArr, err in //haya7'od el locaion as coordinate we yerga3 placemark
            if let err = err{
                complition(nil,err)
                return
            }
            guard let firstPlacemark = plcaeMarksArr?.first else {return}
            complition(firstPlacemark,nil)
        }
    }
    
    func requestTrip(){//will be called on accept button on AcceptTripView
        guard let driver = homeVM.drivers.first,
        let currentUser = homeVM.currentUser,
        let dropOFLocation = locationVM.selectedUberLocation else {return}
        let dropLocationGeoPoint = GeoPoint(latitude: dropOFLocation.coordinate.latitude, longitude: dropOFLocation.coordinate.longitude)
        let userLocation = CLLocation(latitude: currentUser.coordinates.latitude,
                                      longitude: currentUser.coordinates.longitude)
        getPlaceMark(location: userLocation) { placeMark, err in
            guard let placeMark = placeMark else {return}
            
            
            let trip = TripModel(id: UUID().uuidString,
                                 passengerID: currentUser.uid,
                                 driverID: driver.uid,
                                 passengerName: currentUser.fullName,
                                 driverName: driver.fullName,
                                 driverlocation: driver.coordinates,
                                 passengerLocation: currentUser.coordinates,
                                 pickUpLocation: currentUser.coordinates,
                                 dropOffLocation: dropLocationGeoPoint,
                                 pickupLocationName: placeMark.name ?? "unknowen",
                                 dropOffLocationName: dropOFLocation.title,
                                 pickupLocationAddress: "16 elmoutasem street",
                                 tripCost: 50.0)
            
            if let encodedTrip = try? Firestore.Encoder().encode(trip){
                Firestore.firestore().collection("trips").document(trip.id).setData(encodedTrip)
            }
        }
        
    }
}
/*
 Shared Model Layer: Implement a dedicated shared model layer that encapsulates the data and business logic that both ViewModels require. Both ViewModels would then interact with this shared model, observing changes and reacting accordingly. This promotes a cleaner separation of concerns and improves testability.
 Delegate Pattern: If one ViewModel needs to trigger actions or receive updates from another ViewModel, a delegate pattern can be employed. The "source" ViewModel can define a protocol, and the "receiving" ViewModel can conform to this protocol and be set as the delegate.
 
 It is generally discouraged to directly inject EnvironmentObjects into another ViewModel in SwiftUI. EnvironmentObjects are designed to be consumed by Views in the view hierarchy. //to check that later
 */
