//
//  HomeLocationVM.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 31/10/2025.
//

import SwiftUI
import Firebase
import MapKit

//class HomeLocationSharedModel: ObservableObject {//will try to use shared model layer here in HomeLocationVM instade of combine LoactionSearchVM with HomeViewModel
//    @EnvironmentObject var locationVM: LoactionSearchVM
//    @EnvironmentObject var homeVM: HomeViewModel
//}


class TripService{
    
    @EnvironmentObject var locationVM: LoactionSearchVM
    @EnvironmentObject var homeVM: HomeViewModel
    @Published var tripModel:TripModel?//when get a value we will show the accept trip view
    static let shared = TripService()
    
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
    
    func fetchTrips(){
        guard let currentUser = homeVM.currentUser ,currentUser.accountType == .driver else {return}
        Firestore.firestore().collection("trips")
            .whereField("driverId", isEqualTo: currentUser.uid)
            .getDocuments {[weak self] snapshot, _ in
                guard let self = self,let document = snapshot?.documents.first, let trip = try? document.data(as: TripModel.self) else {return}
                self.tripModel = trip//will be populated and show accept trip view
                
                self.locationVM.getDestinationRoute(from: trip.driverlocation.toCoordinate, to: trip.dropOffLocation.toCoordinate) { route in
                    //el route ye2dar ye7seb meno el distance we eltime we yekamel beh el trip
                    self.tripModel?.distnceToPassenger = route.distance.toDistance
                    self.tripModel?.travelTime = Int(route.expectedTravelTime/60)
                }
            }
    }
    
    func addressFromPlaceMark(placeMark:CLPlacemark)->String{
        var result = ""
        if let throughtFare = placeMark.thoroughfare{//3ashan ageb el esm el makn ely feh el passenger
            result += throughtFare
        }
        if let subThroughtFare = placeMark.subThoroughfare{
            result += " \(subThroughtFare)"
        }
        if let subAdmenstritive = placeMark.subAdministrativeArea{//like town or city
            result += ", \(subAdmenstritive)"
        }
        return result
    }
    
    func acceptTrip(){
        updateTrip(.accepted)
    }
    
    func rejectTrip(){
        updateTrip(.rejected)
    }
    
    func updateTrip(_ state:TripState){
        guard let tripModel = tripModel,  let tripId = tripModel.id else {return}
        Firestore.firestore().collection("trips").document(tripId).updateData(["state": state]) { err in
            print(err ?? "")
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
                                 pickupLocationAddress: self.addressFromPlaceMark(placeMark: placeMark),
                                 tripCost: 50.0, state: .requested)
            
            if let encodedTrip = try? Firestore.Encoder().encode(trip){
                Firestore.firestore().collection("trips").document(trip.id ?? "").setData(encodedTrip)
            }
        }
        
    }
    
    func addTripObserver(){
        guard let currentUser = homeVM.currentUser, currentUser.accountType == .passenger else { return }
        Firestore.firestore().collection("trips").whereField("passengerID", isEqualTo: currentUser.uid).addSnapshotListener { snapShot, err in
            guard let change = snapShot?.documentChanges.first,
                  (change.type == .added || change.type == .modified),
                  let trip = try? change.document.data(as: TripModel.self) else { return }
        }
    }
    
}
/*
 Shared Model Layer: Implement a dedicated shared model layer that encapsulates the data and business logic that both ViewModels require. Both ViewModels would then interact with this shared model, observing changes and reacting accordingly. This promotes a cleaner separation of concerns and improves testability.
 Delegate Pattern: If one ViewModel needs to trigger actions or receive updates from another ViewModel, a delegate pattern can be employed. The "source" ViewModel can define a protocol, and the "receiving" ViewModel can conform to this protocol and be set as the delegate.
 
 It is generally discouraged to directly inject EnvironmentObjects into another ViewModel in SwiftUI. EnvironmentObjects are designed to be consumed by Views in the view hierarchy. //to check that later
 */
