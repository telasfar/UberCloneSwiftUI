//
//  HomeView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 08/10/2025.
//

import SwiftUI

struct HomeView: View {
    
    //@State private var showLoctionView: Bool = true//han7ot badalaha el map state enum
    @State private var mapViewState:MapViewState = .noInput
    @EnvironmentObject var viewModel: LoactionSearchVM//hayklim beh el RideRequestView 3ashan yepaselo el location ely gaylo men el onRecieve beta3 el publisher
    @EnvironmentObject var authviewModel: AuthViewModel//meno hane3raf ne3red el home wala el login law el user mosh logged
    var body: some View {
        Group{
            if authviewModel.userSession == nil{
                LoginView()
            }else{
                ZStack (alignment: .bottom){//to be moved in a seperate view
                    
                    ZStack(alignment: .top) {
                        //UberMabViewRepresntable()//will use the enum to pass the state to UberMabViewRepresntable
                        UberMabViewRepresntable(mapState: $mapViewState)
                            .ignoresSafeArea()
                        
                        if mapViewState == .noInput {
                            LocationSearchActivationView()
                                .padding(.vertical,60)
                                .onTapGesture {
                                    withAnimation(.bouncy) {
                                        //showLoctionView.toggle()
                                        mapViewState = .searchingLocation
                                    }
                                    
                                }
                        }else if mapViewState == .searchingLocation{
                            LocationSearchView(mapState: $mapViewState)
                            
                        }
                        
                        MapActionButtom(mapState: $mapViewState)
                            .padding(.leading)
                        
                    }
                    
                    if mapViewState == .locationSelected || mapViewState == .polylineAdded{
                        RideRequestView()
                            .transition(.move(edge: .bottom))//el animation coming from LocalSearchView
                    }
                }
                .onReceive(LocationManager.shared.$userLocation) { location in
                    if let location = location{
                        print(location)
                        viewModel.userLocation = location//pass location to VM
                    }
                }
            }
        }

    }
}

#Preview {
    HomeView()
}
