//
//  HomeViewModel.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 24/10/2025.
//

import Foundation
import FirebaseFirestore

class HomeViewModel:ObservableObject{
    
    @Published var drivers = [User]()
    
    init(){
        fetchAllDerivers()
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
