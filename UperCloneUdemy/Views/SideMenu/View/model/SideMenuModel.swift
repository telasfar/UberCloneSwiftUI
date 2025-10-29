//
//  SideMenuModel.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 18/10/2025.
//

import Foundation

enum SideMenuModel: String, CaseIterable {
    case trips
    case wallet
    case messages
    case settings
    
    var title: String {
        switch self {
            case .trips:
            return "Trips"
        case .wallet:
            return "Wallet"
        case .messages:
            return "Messages"
        case .settings:
            return "Settings"
        }
    }
    
    var imgName: String {
        switch self {
        case .trips:
            return "light.strip.2"
        case .wallet:
            return "wallet.bifold"
        case .messages:
            return "message"
        case .settings:
            return "gear"
        }
    }
}
