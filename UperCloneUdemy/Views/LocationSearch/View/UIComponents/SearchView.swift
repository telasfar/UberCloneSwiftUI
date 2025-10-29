//
//  SearchView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 22/10/2025.
//

import SwiftUI

struct SearchView: View {
     @StateObject var viewModel:LoactionSearchVM
    var body: some View {
        HStack {
            Image(systemName: "arrow.left")
            .font(.title)
            .imageScale(.medium)
            .padding(.leading,8)
            
            TextField("Search for Location", text: $viewModel.queryString)
                .frame(height: 40)
                .padding(.leading,16)//1
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.trailing,16)//el textfield kolo bel background
        }
    }
}

#Preview {
    SearchView(viewModel: LoactionSearchVM())
}

//1 7'od balak en el padding 2abl el background fa dah 7'ala el text ely gowa el textfield yeb3ed shewaya 3an nehayet el textfield we law 7atetaha abl el background hatshof el far2
