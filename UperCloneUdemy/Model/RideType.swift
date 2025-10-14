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
    
    var baseFare: Double{
        switch self {
        case .uberX:
            return 25.0
        case .uberBlack:
            return 35.0
        case .uberTaxi:
            return 15.0
        }
    }
    
    var distanceRate: Double{
        switch self {
        case .uberX:
            return 0.5
        case .uberBlack:
            return 0.75
        case .uberTaxi:
            return 1.0
        }
    }
    
    func computDistanceFare(distance: Double) -> Double{
        return baseFare + (distanceRate * distance)
    }
}
