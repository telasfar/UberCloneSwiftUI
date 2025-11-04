//
//  AcceptTripView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 28/10/2025.
//

import SwiftUI
import Firebase
import MapKit

struct AcceptTripView: View {
    let btnWidth = (UIScreen.main.bounds.width * 0.5) - 48
    let trip:TripModel
    
    var body: some View {
        VStack{
            Capsule()
                .fill(Color(.systemGray5))
                .frame(width: 48, height: 8)
            
            HeaderTripView(tripTime:"\(trip.travelTime ?? 0)")
            
            ProfileTripView(name: trip.passengerName, cost: trip.tripCost)
            
            MapTripView(pickupLocation: trip.dropOffLocation,pickupName: trip.pickupLocationName, pickupAddress: trip.pickupLocationAddress, annotation: UberLocation(title: trip.dropOffLocationName, coordinate:trip.dropOffLocation.toCoordinate ), distanceOFtrip: trip.distnceToPassenger ?? "")
            
            HStack{
                Button{
                    TripService.shared.acceptTrip()
                }label:{
                    Text("REJECT")
                }
                .foregroundStyle(Color.white)
                .frame(width: btnWidth)
                .padding()
                .background(Color.red)
                .cornerRadius(8)
                
                
                Button{
                    TripService.shared.rejectTrip()
                }label:{
                   Text("ACCEPT")
                }
                .foregroundStyle(Color.white)
                .frame(width: btnWidth)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
            }
            .padding()
        }
        .background(Color.theme.backGroundColor)
        .cornerRadius(16)
        .shadow(color:Color.gray,radius: 8)//3amal el shadow dah 3ashan yedy lel user impresiom enhom two seperate view above each other lma ye7sal el pop up fo2 el homeview
    }
}
    


#Preview {
    AcceptTripView( trip: TripModel.init(id: "", passengerID: "", driverID: "", passengerName: "", driverName: "", driverlocation: GeoPoint(latitude: 5, longitude: 4), passengerLocation: GeoPoint(latitude: 5, longitude: 4), pickUpLocation: GeoPoint(latitude: 5, longitude: 4), dropOffLocation: GeoPoint(latitude: 5, longitude: 4), pickupLocationName: "", dropOffLocationName: "", pickupLocationAddress: "", tripCost: 7, state: .accepted))
}

