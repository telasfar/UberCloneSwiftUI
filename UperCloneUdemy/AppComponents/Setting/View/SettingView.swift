//
//  SettingView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 19/10/2025.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack{
            List{
                Section{
                    // user infor hidder
                    HeaderViewMenu(name: "Tariq", email: "test@test.com")
                }
                
                Section("Favorites"){
                    
                }
                
                Section("Setting"){
                    
                }
                
                Section("Account"){
                    
                }
            }
        }
    }
}

#Preview {
    SettingView()
}
