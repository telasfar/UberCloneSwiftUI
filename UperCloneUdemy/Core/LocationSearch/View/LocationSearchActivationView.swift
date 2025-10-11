//
//  LocationSearchActivationView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 10/10/2025.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        HStack{
            Rectangle()
                .fill(.black)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            
            Text("Where to ?")
                .foregroundColor(Color(.darkGray))
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width-64, height: 50)
        .background(
            Rectangle().fill(Color(.white))
                .shadow(color:.gray,radius: 4)
        )
    }
}

#Preview {
    LocationSearchActivationView()
}
