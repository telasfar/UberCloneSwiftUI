//
//  MapTripView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 28/10/2025.
//

import SwiftUI
import MapKit//ahteb2a baseta mosh ha7tag lel UIViewRepresentable

struct MapTripView: View {
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 30.033333, longitude: 31.233334), span: MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025))

    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("koleyet el tegara")
                        .bold()
                    Text("Elmoutasem street")
                        
                }
                
                Spacer()
                
                VStack{
                    Text("2")
                        .bold()
                    Text("KM")
                }

            }
            .padding()
            
            Map(coordinateRegion: $region)
                .cornerRadius(12)
                .shadow(color:.gray,radius: 8)
                .padding()
        }
    }
}

#Preview {
    MapTripView()
}
