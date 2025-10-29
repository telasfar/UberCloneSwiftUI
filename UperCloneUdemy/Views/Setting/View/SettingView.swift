//
//  SettingView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 19/10/2025.
//

import SwiftUI
import Firebase

struct SettingView: View {
    let user:User
    @EnvironmentObject var authviewModel: AuthViewModel
    var body: some View {
        VStack{
            List{
                Section{
                    // user infor hidder
                    HeaderViewMenu(name: user.fullName, email: user.email)
                }
                .padding(.top,8)
                
                Section("Favorites"){
                                        
                    ForEach(SavedLocationModel.allCases) { model in
                        NavigationLink {
                            Text("helo")
                        } label: {
                            FavoriteCell(name: model.title, email: "test@test.com", imgName: model.imgName)
                                .padding(.vertical)
                        }

                        
                    }
                }
                
                Section("Setting"){
                    ImageTextView(imgName: "bell",title:"Notifiction")
                    ImageTextView(imgName: "wallet.bifold",title:"payment")
                    
                }
                
                Section("Account"){
                    ImageTextView(imgName: "dollarsign.circle",title:"Make money")
                    ImageTextView(imgName: "arrow.left",title:"sign out")
                        .onTapGesture {
                            print("Sign out")
                            authviewModel.signOut()
                        }
                }
            }
        }
        
        .navigationTitle("Settings")//7'od balak 7at el navigation title feen
        .navigationBarTitleDisplayMode(.large)//3ashan yeb2a dayman font kbeer
    }
}

#Preview {
    NavigationStack{
        SettingView(user: User(fullName: "tariq", email: "test@test.com", uid: "23432523",accountType: .driver, coordinates: GeoPoint(latitude: 30.21, longitude: 30.231)))
    }//7at el nvigation stack dah 3ashan el navigationTitle yezhar fe el preview
}
