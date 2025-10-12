//
//  MapActionButtom.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 10/10/2025.
//

import SwiftUI

struct MapActionButtom: View {
   // @Binding var showLocationSearchView: Bool//to be binded with the state on homeview
    @Binding var mapState: MapViewState
    var body: some View {
        Button {
            withAnimation(.bouncy) {
                actionForState(mapState)
                //showLocationSearchView.toggle()//will send the value throught binding to state
            }
        }label:{
            Image(systemName: mapState == .noInput ? "line.3.horizontal":"arrow.left")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color:.black,radius: 2)
        }
        .frame(maxWidth: .infinity,alignment: .leading)//7ata dah 3ashan yeb2a 3ala el shemal dayman
    }
    
    
    func actionForState(_ state:MapViewState){
        switch state {
        case .noInput:
            break
        case .searchingLocation:
            mapState = .noInput//la2en el button dah bey3'ayr el state fala lwa kont fe el search haywadeno lel noInput state
        case .locationSelected:
            mapState = .noInput//2e3taber hena en eluser ba3d ma7'tar location rege3 fe kalmo we 3aml back  ?
        }
    }
}

#Preview {
    MapActionButtom(mapState: .constant(.searchingLocation))
}
