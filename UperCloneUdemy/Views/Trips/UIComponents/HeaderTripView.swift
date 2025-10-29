//
//  HeaderTripView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 28/10/2025.
//

import SwiftUI

struct HeaderTripView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Would you like to pick up this passenger")
                    .font(.headline)
                    .lineLimit(2)//3ala satreen
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                VStack{
                    Text("10")
                        .bold()
                    Text("Minutes")
                        .bold()//7elwa el bold deh
                }
                .foregroundStyle(Color.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
                
            }
            
            Divider()

        }
        .padding()
        
    }
}

#Preview {
    HeaderTripView()
}
