//
//  HomeViewModel.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 24/10/2025.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import Combine

class HomeViewModel:ObservableObject{
    
    @Published var drivers = [User]()
     var cancalable = Set<AnyCancellable>()
    @Published var currentUser:User?
    @Published var trip:TripModel?

    init(){
        fetchUser()
        TripService.shared.$tripModel
            .compactMap(\.self)
            .sink { trip in
                self.trip = trip
            }
            .store(in:&cancalable)
    }
    
    func fetchUser(){
//        guard let userID = Auth.auth().currentUser?.uid else {return}//you can get it from the userSeccion as well
//        Firestore.firestore().collection("users").document(userID).getDocument {  snapshot, err in
//            if let err = err{
//                print(err)
//                return
//            }
//            guard let user = try? snapshot?.data(as: User.self) else {return}
//            if user.accountType == AccountType.passenger{
//                self.fetchAllDerivers()//will get the drivers only if you logged as a passenger
//            }
//        }
        
//        UserServices.fetchUser { user in
//            if user.accountType == AccountType.passenger{
//                self.fetchAllDerivers()
//            }
//        }//hayets7'dem el publisher 3ashan yenady 3ala el api mara wa7da
        
        UserServices.shared.$user
            .compactMap(\.self)
            .sink { user in
                if user.accountType == AccountType.passenger{
                    self.currentUser = user
                    if user.accountType == .passenger{
                        self.fetchAllDerivers()
                        TripService.shared.addTripObserver()//to listen if trip accepted or rejected
                    }else{
                        TripService.shared.fetchTrips()
                    }
                }
            }
            .store(in:&cancalable)
        
    }
    
    func fetchAllDerivers(){
        Firestore.firestore().collection("users")
            .whereField("accountType", isEqualTo: AccountType.driver.rawValue)
            .getDocuments { snapshot, err in
                guard let documents = snapshot?.documents else {return}
                //let driversArray = documents.map { try? $0.data(as: User.self)}//.map raga3at [User?]() fa esta7'dem compact map 3ashan yeshel el nil
                let driversArray = documents.compactMap { try? $0.data(as: User.self)}
                self.drivers = driversArray
            }
    }
    
//    func fetchTrips(){
//        guard let currentUser = currentUser ,currentUser.accountType == .driver else {return}
//        Firestore.firestore().collection("trips")
//            .whereField("driverId", isEqualTo: currentUser.uid)
//            .getDocuments { snapshot, _ in
//                guard let document = snapshot?.documents.first, let trip = try? document.data(as: TripModel.self) else {return}
//                self.tripModel = trip//will be populated and show accept trip view
//            }
//    }
}
