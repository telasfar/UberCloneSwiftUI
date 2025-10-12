//
//  SuggestedRideView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 12/10/2025.
//

import SwiftUI

struct SuggestedRideView: View {
    var imgName:String
    var title:String
    var body: some View {
        
        VStack() {
            Image(imgName)
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading,spacing: 4){
                Text(title)
                    .font(.headline)
                
                Text("22.5$")
            }
        }
        .frame(width: 114,height: 140)
        .background(Color(.systemGroupedBackground))
        .cornerRadius(8)
    }
}

#Preview {
    SuggestedRideView(imgName: "uber-x", title: "Uber")
}
