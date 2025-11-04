//
//  ExtensionDouble.swift
//  UperCloneUdemy
//
//  Created by Tariq Maged on 13/10/2025.
//

import Foundation

extension Double{
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var distanceFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        return formatter
    }
    var toCurrency:String{
        return currencyFormatter.string(for:self) ?? ""
    }
    
    var toDistance:String{
        return distanceFormatter.string(for:self) ?? ""
    }
}
