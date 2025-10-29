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
    private var cancalable = Set<AnyCancellable>()
    
    init(){
        fetchUser()
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
                    self.fetchAllDerivers()
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
}
