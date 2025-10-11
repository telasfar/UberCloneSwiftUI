//
//  UperCloneUdemyApp.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 08/10/2025.
//

import SwiftUI

@main
struct UperCloneUdemyApp: App {
    @StateObject var loctionViewModel = LoactionSearchVM()//3amlo inject fe el environemnt 3ahsn haye7tag nafs el instance beta3to fe LocationSearchView we fe UberMabViewRepresntable 3ashan yesta7'dem el selectedLocation fa haykon feh instance wa7da shayla el etenen le kol el app

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(loctionViewModel)//keda ka2en el UberMabViewRepresntable (listen to VM) beytkalim ma3a LocationSearchView (write to VM) 3an tare2 el VM beytkalimo ma3a ba3d betrae2 3'eer mobasher
        }
    }
}

//3ahsan tero7 le info.plist ro7 lel project men fo2 we 2e3mel click 3ala info we hatla2y el info.plist

