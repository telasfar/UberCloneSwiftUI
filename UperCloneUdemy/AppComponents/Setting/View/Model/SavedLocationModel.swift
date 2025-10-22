//
//  SavedLocationModel.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 21/10/2025.
//

import Foundation
enum SavedLocationModel :Int, CaseIterable, Identifiable {
    var id: Int{
        self.rawValue
    }
    
    case home
    case work
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .work:
            return "Work"
        }
    }
    
    var imgName: String {
        switch self {
        case .home:
            return "house"
        case .work:
            return "network"
        }
    }
}
