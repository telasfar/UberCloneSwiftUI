//
//  SocialMediaView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 17/10/2025.
//

import SwiftUI

struct SocialMediaView: View {
    var body: some View {
        VStack(spacing: 16){
            //divider + text
            HStack(spacing: 16){
                Rectangle()
                    .frame(width: 75,height: 1)
                    .foregroundColor(.white)
                
                Text("Sign in with Social")
                    .font(.system(size: 13, weight: .medium, design: .default))
                    .foregroundColor(.white)
                
                Rectangle()
                    .frame(width: 75,height: 1)
                    .foregroundColor(.white)
            }
            
            //social buttons
            HStack(spacing: 24){
                Button {
                    
                } label: {
                   Image("facebook")
                        .resizable()
                        .frame(width: 60, height: 40)
                        .cornerRadius(8)
                }
                
                Button {
                    
                } label: {
                    Image("google")
                         .resizable()
                         .frame(width: 40, height: 40)
                         .cornerRadius(8)
                }

            }
        }
    }

}

#Preview {
    SocialMediaView()
}
