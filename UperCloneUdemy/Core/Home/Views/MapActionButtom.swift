//
//  MapActionButtom.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 10/10/2025.
//

import SwiftUI

struct MapActionButtom: View {
    @Binding var showLocationSearchView: Bool//to be binded with the state on homeview
    var body: some View {
        Button {
            withAnimation(.bouncy) {
                
                showLocationSearchView.toggle()//will send the value throught binding to state
            }
        }label:{
            Image(systemName: showLocationSearchView ? "line.3.horizontal":"arrow.left")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color:.black,radius: 2)
        }
        .frame(maxWidth: .infinity,alignment: .leading)//7ata dah 3ashan yeb2a 3ala el shemal dayman
    }
}

#Preview {
    MapActionButtom(showLocationSearchView: .constant(true))
}
