//
//  RideRequestView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 12/10/2025.
//

import SwiftUI

struct RideRequestView: View {
    @State private var selectedRideType: RideType = .uberX//7ata fe state 3ashan el user hayswitch benhom we haye7tagaha fe el animation
    
    var body: some View {
        VStack{
            Capsule()
                .fill(Color(.systemGray5))
                .frame(width: 48, height: 8)
            
            HStack{
                DashedView()
                    .padding(.leading,8)
                
                VStack(alignment:.leading, spacing:16){
                    HStack{
                        Text("Current Location")
                            .font(.caption)
                        Spacer()
                        Text("1.44 pm")
                    }
                    .foregroundColor(.gray)
                    
                    
                    HStack{
                        Text("Current Location")
                            .font(.caption)
                        Spacer()
                        Text("1.44 pm")
                    }
                    .foregroundColor(.black)
                    
                }
                .padding(.horizontal,8)
                
            }
            
            Section{
                Divider()
                
                Text("Request Details")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            ScrollView(.horizontal){
                HStack(spacing: 12){
                    ForEach(RideType.allCases,id: \.self){type in
                        SuggestedRideView(imgName: type.imageName, title: type.description)
                    }
                }
            }
            .padding(.bottom,8)
            
            PaymentFooter()
            
            Button{
                
            }label:{
                Text("CONFIRM RIDE")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,minHeight: 50)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding(.horizontal,16)
            }
            
        }
        .background(.white)
    }
}

#Preview {
    RideRequestView()
}
