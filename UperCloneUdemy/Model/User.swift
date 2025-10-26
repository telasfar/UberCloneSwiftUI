//
//  User.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 18/10/2025.
//

import Foundation
import Firebase

struct User: Codable {//3amal el struct dah 3ashan haykon el template ely el han upload beh el user data lel FIrebase
    let fullName: String
    let email: String
    let uid: String
    var accountType:AccountType //3amlo var 3ashan momken yet3'ayar we momken el driver yekon passenger 3ady
    var coordinates:GeoPoint
    var homeLocation:locationModel?
    var workLocation:locationModel?
}

enum AccountType:Int ,Codable{//Int hena la2en ely hayet7'azen fe el DB hwa 0 aw 1 el row values beta3et el cases
    case passenger
    case driver
}
