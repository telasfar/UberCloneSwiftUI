//
//  ExtensionColor.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 17/10/2025.
//

import SwiftUI

extension Color{
    
    struct ColorTheme: Hashable {
        var backGroundColor = Color("backGroundColor")
    }
    
    
    static let theme = ColorTheme()
}


