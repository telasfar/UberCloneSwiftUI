//
//  SavedLocationSearchView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 22/10/2025.
//

import SwiftUI

struct SavedLocationSearchView: View {
    @State var searchText: String = ""
   var viewModel = LoactionSearchVM()//lma shelt @stateObject el donia matla7'abtetsh
    let savedLocationConfig:SavedLocationModel
    var body: some View {
        VStack {
            SearchView(viewModel: viewModel)
            Spacer()
            SearchResultView(viewModel:viewModel, config: .saveLocation(savedLocationConfig))
            
        }
        .navigationTitle(savedLocationConfig.title)
    }
}

#Preview {
    NavigationStack{
        SavedLocationSearchView(savedLocationConfig: .home)
    }//3ashan yeshof el navigationTitle
         
}
