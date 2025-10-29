//
//  RideRequestView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 12/10/2025.
//

import SwiftUI

struct RideRequestView: View {
    @State private var selectedRideType: RideType = .uberX//7ata fe state 3ashan el user hayswitch benhom we haye7tagaha fe el animation
    @EnvironmentObject var viewModel: LoactionSearchVM

    var body: some View {
        VStack{
            Capsule()
                .fill(Color(.systemGray5))
                .frame(width: 48, height: 8)//7at el capsule deh ely haye3mel menha drag law 7ab ye2fel el view
            
            HStack{
                DashedView()
                    .padding(.leading,8)
                
                VStack(alignment:.leading, spacing:16){
                    HStack{
                        Text("Current Location")
                            .font(.caption)
                        Spacer()
                        Text(viewModel.pickUpTime ?? "")
                    }
                    .foregroundColor(.gray)
                    
                    
                    HStack{
                        if let location = viewModel.selectedUberLocation{
                            Text(location.title)
                                .font(.caption)
                        }
                        Spacer()
                        Text(viewModel.dropOffTime ?? "")
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
                        SuggestedRideView(imgName: type.imageName, title: type.description,price: (viewModel.computRidePrice(type:type)).toCurrency)
                            .background(Color(selectedRideType == type ? .systemBlue:.systemGroupedBackground))
                            .cornerRadius(8)
                            .scaleEffect(selectedRideType == type ? 1.2:1)
                            .onTapGesture {
                                withAnimation{
                                    selectedRideType = type

                                }
                            }
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
        .background(Color.theme.backGroundColor)
    }
}

#Preview {
    RideRequestView()
        .environmentObject(LoactionSearchVM())
}
