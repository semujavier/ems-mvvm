//
//  Double+kWh.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 19/3/22.
//

import Foundation

extension Double {
    func toDecimal(fractionDigits: Int = 3) -> String {
        let formatter = NumberFormatter()
        formatter.multiplier = 1
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = fractionDigits
        formatter.maximumFractionDigits = fractionDigits
        return formatter.string(from: NSNumber(value: self))!
    }
}
