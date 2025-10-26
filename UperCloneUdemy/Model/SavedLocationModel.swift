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
    
    var databaseIdentifier: String {
        switch self {
        case .home:
            return "homeLocation"
        case .work:
            return "workLocation"
        }
    }
    
    func getSubTitle(use:User)->String{
        switch self{
            case .home:
            if let homeLocation = use.homeLocation{
                return homeLocation.title
            }
        case .work:
            if let workLocation = use.workLocation{
                return workLocation.title
            }
        }
        return ""
    }
}
