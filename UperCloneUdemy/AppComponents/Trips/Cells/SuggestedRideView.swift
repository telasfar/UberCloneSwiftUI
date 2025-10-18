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
    var price:String
    var body: some View {
        
        VStack() {
            Image(imgName)
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading,spacing: 4){
                Text(title)
                    .font(.headline)
                
                Text(price)
            }
        }
        .frame(width: 114,height: 140)
    }
}

#Preview {
    SuggestedRideView(imgName: "uber-x", title: "Uber", price: "12.9$")
}
