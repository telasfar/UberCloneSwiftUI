//
//  HomeView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 08/10/2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showLoctionView: Bool = true
    
    var body: some View {
        ZStack(alignment: .top) {
            UberMabViewRepresntable()
                .ignoresSafeArea()
            
            if showLoctionView {
                LocationSearchActivationView()
                    .padding(.vertical,60)
                    .onTapGesture {
                        withAnimation(.bouncy) {
                            showLoctionView.toggle()
                        }

                    }
            }else{
                LocationSearchView(showLocationSaerchview: $showLoctionView)
                   
            }
                       
            MapActionButtom(showLocationSearchView: $showLoctionView)
                .padding(.leading)

        }

    }
}

#Preview {
    HomeView()
}
