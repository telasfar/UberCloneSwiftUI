//
//  LocationSearchView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 10/10/2025.
//

import SwiftUI

struct LocationSearchView: View {
    
    @State private var startLocation: String = ""
    //@StateObject var viewModel = LoactionSearchVM()
    @EnvironmentObject var viewModel: LoactionSearchVM//ba2na bengebo men el enviroment..HWA HENA BEY TALK AND TO WRITE 3ALA EL VM GOA EL TAPGESTURE
    //@Binding var showLocationSaerchview: Bool
    @Binding var mapState: MapViewState//hayesta7'dem dah badalshowLocationSaerchview
    var body: some View {
        VStack{
            //Header View
            HStack{
                
                DashedView()
                
                VStack(alignment: .leading){
                    TextField("Current Location",text:$startLocation)
                        .font(.caption)
                        .frame(height: 32)
                        .background(Color(.systemGray5))
                        .cornerRadius(4)
                        .padding(.trailing)
                    
                    
                    TextField("Where to",text:$viewModel.queryString)//3amal link been el text ely hena bel query ely hye7tago fe VM
                        .font(.caption)
                        .frame(height: 32)
                        .background(Color(.systemGray5))
                        .cornerRadius(4)
                        .padding(.trailing)
                    
                }
                
            }
            .padding(.horizontal)
            .padding(.top)
            
            Divider()
                .padding(.vertical)
            
            //List View
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(viewModel.locations,id:\.self){result in
                        LocationSearchCell(title: result.title, subTitle: result.subtitle)
                            .onTapGesture {
                                withAnimation{//will affect the transitions on HomeView
                                    viewModel.selectLocation(location: result)
                                    //showLocationSaerchview.toggle()
                                    mapState = .locationSelected
                                }

                            }
                    }
                }
            }
        }
        .background(Color.theme.backGroundColor)
        
    }
}

#Preview {
    LocationSearchView( mapState: .constant(.searchingLocation))
        .environmentObject(LoactionSearchVM())
}
