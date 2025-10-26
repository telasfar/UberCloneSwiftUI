//
//  AuthViewModel.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 17/10/2025.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore




class AuthViewModel:ObservableObject{//haye3melo inject fe el APP environment
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser:User?//hayeb3ato lel SideMnuView
    
    init(){
        userSession = Auth.auth().currentUser//law feh logged user el Auth.auth().currentUser mosh hatkon be null
        fetchUser()
    }
    
    func registerUser(email:String, password:String, fullname:String){
        guard let location = LocationManager.shared.userLocation else {return}
        Auth.auth().createUser(withEmail: email, password: password){result,err in
            if let err = err {
                print(err)
                return
            }
            print(result?.user.uid ?? "")//lma el uid haykon mawgood fe el firbase el homeView hya ely hatezhar lel user la2eno mosh haykon be nil
            guard let userResult = result?.user else {return}
            self.userSession = userResult//published to show the home view
            let user = User(fullName: fullname, email: email, uid: userResult.uid,accountType: .driver,coordinates: GeoPoint(latitude: location.latitude, longitude: location.longitude))
            let encodedUser = try? Firestore.Encoder().encode(user)
            if let encodedUser = encodedUser{
                Firestore.firestore().collection("users").document(userResult.uid).setData(encodedUser)//sava the user data in FireStore
            }
            self.fetchUser()//to fix the bug when you relogin with another user to get the lat one
        }
    }
    
    func signInUser(email:String, password:String){
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print(err)
                return
            }
            self.userSession = result?.user
            self.fetchUser()
        }
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut()
            userSession = nil//3ashan te publish enha ba2et be nil fa el login screen tezher lma el view te rerender
        }catch let err{
            print(err)
        }
    }
    
    func fetchUser(){
        guard let userID = Auth.auth().currentUser?.uid else {return}//you can get it from the userSeccion as well
        Firestore.firestore().collection("users").document(userID).getDocument {  snapshot, err in
            if let err = err{
                print(err)
                return
            }
            guard let user = try? snapshot?.data(as: User.self) else {return}
            self.currentUser = user
        }
    }
}
