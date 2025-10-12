//
//  RideType.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 12/10/2025.
//

import Foundation

enum RideType: Int, CaseIterable, Identifiable {//CaseIterable hayesta7'demha fe ForEach
    case uberX
    case uberBlack
    case uberTaxi
    
    var id: Int { rawValue }
    
    var imageName: String {
        switch self {
        case .uberX:
            return "uber-x"
        case .uberBlack:
            return "uber-black"
        case .uberTaxi:
            return "uber-taxi"
        }
    }
    
    var description: String {
        switch self {
        case .uberX:
            return "Uber X"
        case .uberBlack:
            return "Uber Black"
        case .uberTaxi:
            return "Uber Taxi"
        }
    }
}
