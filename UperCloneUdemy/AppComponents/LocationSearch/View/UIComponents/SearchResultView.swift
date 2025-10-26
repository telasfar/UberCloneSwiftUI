//
//  SearchResultView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 22/10/2025.
//

import SwiftUI

struct SearchResultView: View {
    
    //@EnvironmentObject var viewModel: LoactionSearchVM //TODO embty locationArray and reset the search query to be able to reuse this instade of StateObject ViewModel
    
    @StateObject var viewModel:LoactionSearchVM//1
    let config:LocationSearchConfig
   // @Binding var mapState: MapViewState
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                ForEach(viewModel.locations,id:\.self){result in
                    LocationSearchCell(title: result.title, subTitle: result.subtitle)
                        .onTapGesture {
                            withAnimation{//will affect the transitions on HomeView
                                viewModel.selectLocation(location: result, config: config)
                                //showLocationSaerchview.toggle()
                               // mapState = .locationSelected//2
                            }

                        }
                }
            }
        }
    }
}

#Preview {
    SearchResultView(viewModel: LoactionSearchVM(), config: .saveLocation(.home))
}

//1 magabsh dah men el environment 3ashan law kona 3amlna serach maslan fe LOcationSaerchView we 3amlna back we ro7na lel SavedLocationSearchView kona hanla2y nafs nateget el search hena la2en el locations publisher ely fe el VM haykon filled be results kman...bas dah tabe3y enak sa3at bete7tag a new fresh object of the VM to use it in another place of the app

//2 shal el mapstate la2en el subView dah 3ashan yekkon reusable lazem el view ely beysta7'demo maykonsh leh 3elaka wala ye3ref 7aga 3an el mapState 
