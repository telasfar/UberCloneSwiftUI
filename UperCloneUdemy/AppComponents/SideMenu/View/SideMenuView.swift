//
//  SideMenuView.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 18/10/2025.
//

import SwiftUI

struct SideMenuView: View {
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }//lma shelt el init dah edany error besabab private let user
    
    var body: some View {
       // NavigationStack{//na2alo lel Zstack ely fe el HomeView 3ashan lma sabo hena el sidemenu kanet mafto7a we el navigation bey7sal bas hwa na2lo el HomeView 3ashan kol el screen te navigate
        VStack(alignment: .leading){
                
                HeaderViewMenu(name: user.fullName, email: user.email)
                
                BecomeDriverView()
                
                Spacer()//push all to the top
                
                ForEach(SideMenuModel.allCases, id: \.self){menuModel in
                    NavigationLink(value: menuModel) {//NavigationLink dah beya7'od value we label we dah 3'er ely beya7'od destination bas ha7ot eld estination ba3deen
                        ImageTextView(imgName: menuModel.imgName, title: menuModel.title)
                            .padding(.vertical,8)
                    }
                }
                .navigationDestination(for: SideMenuModel.self) { menuModel in//law kan galak gfe el NavigationLink(value) 7aga men el no3 SideMenuModel yeb2a 2esta7'dem el modifier dah
                    
                    switch menuModel {
                    case .settings:
                        SettingView(user: user)
                    case .messages:
                        Text("Messages")
                    case .trips:
                        Text("Trips")
                    case .wallet:
                        Text("Wallet")
                    }
                }
                
                Spacer()
            }
            .padding()
       // }
    }
}

#Preview {
    NavigationStack{//3ashan tesha3'al el navigation destination
        SideMenuView(user: User(fullName: "ahmed", email: "test@examble.com", uid: "34527789"))
    }
}

//Elfekra eno hay7ot el sideMenu ta7t el HomeView fe ZStack we lma el user ye3ml click 3ala MapActionButton haydrag el offset beta3 el home 3ashan yezher el SideMenu

//la7ez en el navigation destination beydek el tabGesture we beysha3'lo lewa7do
