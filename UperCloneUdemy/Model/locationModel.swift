//
//  locationModel.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 22/10/2025.
//

import Foundation
import Firebase

struct locationModel:Codable{
    let title:String
    let address:String
    let coordinate:GeoPoint//gay men el Firebase to upload coordinates to firebase database we gowah latitude we longitude
}
