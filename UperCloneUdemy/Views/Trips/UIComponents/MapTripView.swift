//
//  MapTripView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 28/10/2025.
//

import SwiftUI
import MapKit//ahteb2a baseta mosh ha7tag lel UIViewRepresentable
import Firebase

struct MapTripView: View {
    @State var region:MKCoordinateRegion
    let pickupName:String
    let pickupAddress:String
    let annotation:UberLocation
    let distanceOFtrip:String
    init(pickupLocation:GeoPoint,pickupName:String, pickupAddress:String,annotation:UberLocation ,distanceOFtrip:String){
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: pickupLocation.latitude, longitude: pickupLocation.longitude), span: MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025))
        self.pickupName = pickupName
        self.pickupAddress = pickupAddress
        self.annotation = annotation
        self.distanceOFtrip = distanceOFtrip
    }
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text(pickupName)
                        .bold()
                    Text(pickupAddress)
                        
                }
                
                Spacer()
                
                VStack{
                    Text(distanceOFtrip)
                        .bold()
                    Text("KM")
                }

            }
            .padding()
           
            Map(coordinateRegion: $region,annotationItems: [annotation]){item in
              //el init dah wa7'ed clousre
                MapMarker(coordinate: item.coordinate)
            }
                .cornerRadius(12)
                .shadow(color:.gray,radius: 8)
                .padding()
        }
    }
}

#Preview {
    MapTripView(pickupLocation: GeoPoint(latitude: 6, longitude: 7), pickupName: "", pickupAddress: "", annotation: UberLocation(title: "", coordinate: CLLocationCoordinate2D(latitude: 99, longitude: 32)), distanceOFtrip: "" )
}
