//
//  UperCloneUdemyApp.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 08/10/2025.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct UperCloneUdemyApp: App {
    @StateObject var loctionViewModel = LoactionSearchVM()//3amlo inject fe el environemnt 3ahsn haye7tag nafs el instance beta3to fe LocationSearchView we fe UberMabViewRepresntable 3ashan yesta7'dem el selectedLocation fa haykon feh instance wa7da shayla el etenen le kol el app
    @UIApplicationDelegateAdaptor var appDelegate: AppDelegate//keda 2e7na 3amlna inject lel Firebase fe el app delegate
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(loctionViewModel)//keda ka2en el UberMabViewRepresntable (listen to VM) beytkalim ma3a LocationSearchView (write to VM) 3an tare2 el VM beytkalimo ma3a ba3d betrae2 3'eer mobasher
                .environmentObject(authViewModel)//momken aktar men envirrnment 3ady
        }
    }
}

//3ahsan tero7 le info.plist ro7 lel project men fo2 we 2e3mel click 3ala info we hatla2y el info.plist

