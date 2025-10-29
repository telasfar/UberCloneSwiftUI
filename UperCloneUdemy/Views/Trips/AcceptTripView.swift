//
//  AcceptTripView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 28/10/2025.
//

import SwiftUI

struct AcceptTripView: View {
    let btnWidth = (UIScreen.main.bounds.width * 0.5) - 48
    var body: some View {
        VStack{
            Capsule()
                .fill(Color(.systemGray5))
                .frame(width: 48, height: 8)
            
            HeaderTripView()
            
            ProfileTripView()
            
            MapTripView()
            
            HStack{
                Button{
                    
                }label:{
                    Text("REJECT")
                }
                .foregroundStyle(Color.white)
                .frame(width: btnWidth)
                .padding()
                .background(Color.red)
                .cornerRadius(8)
                
                
                Button{
                    
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
    }
}
    


#Preview {
    AcceptTripView()
}
