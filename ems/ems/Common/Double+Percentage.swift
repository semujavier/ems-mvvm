//
//  Double+Percentage.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 19/3/22.
//

import Foundation

extension Double {
    
    func toPercentageString(fractionDigits: Int = 2) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = fractionDigits
        formatter.maximumFractionDigits = fractionDigits
        return formatter.string(from: NSNumber(value: self))!
    }
}
