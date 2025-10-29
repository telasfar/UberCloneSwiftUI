//
//  ProfileTripView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 28/10/2025.
//

import SwiftUI

struct ProfileTripView: View {
    var body: some View {
        VStack{
            HStack{
                Image("profileImg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
                VStack(alignment: .leading){
                    Text("AHMED")
                        .font(.title2)
                        .bold()
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundStyle(Color.yellow)
                        Text("4.3")
                        
                    }
                }
                
                Spacer()
                
                VStack{
                    Text("Earning")
                        .bold()
                    Text("22.5$")
                        .font(.title)
                        .bold()//7elwa el bold deh
                }
            }
            .padding()
            
            Divider()
        }
    }
}

#Preview {
    ProfileTripView()
}
