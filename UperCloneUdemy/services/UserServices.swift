//
//  UserServices.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 26/10/2025.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class UserServices{
    
    static let shared = UserServices()
    @Published var user: User?
    
//    static func fetchUser(complition: @escaping (User) -> Void){
//        guard let userID = Auth.auth().currentUser?.uid else {return}//you can get it from the userSeccion as well
//        Firestore.firestore().collection("users").document(userID).getDocument {  snapshot, err in
//            if let err = err{
//                print(err)
//                return
//            }
//            guard let user = try? snapshot?.data(as: User.self) else {return}
//            complition(user)
//        }
//    }
    
    init() {
        fetchUser()
    }
    
     func fetchUser(){
        guard let userID = Auth.auth().currentUser?.uid else {return}//you can get it from the userSeccion as well
        Firestore.firestore().collection("users").document(userID).getDocument {  snapshot, err in
            if let err = err{
                print(err)
                return
            }
            guard let user = try? snapshot?.data(as: User.self) else {return}
            self.user = user
        }
    }//3amal el function deh keda ma3a el @Published user 3ahsn maye3mlsh aktar men api call lam ye fetch el user we yeb2a hwa api call wa7ed bas
}

//3amal el class dah la2en el AUthVM we el homeVM el etnen bey3melo fetch LEl user fa keda fe code common benhom fa hay7otoh hena
