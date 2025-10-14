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
    
    var toCurrency:String{
        return currencyFormatter.string(for:self) ?? ""
    }
}
