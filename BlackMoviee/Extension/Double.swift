//
//  Double.swift
//  BlackMoviee
//
//  Created by Black Billy on 21/3/24.
//

import Foundation

extension Double {
    private var numberFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func asNumberWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return numberFormatter2.string(from: number) ?? "0.00"
    }
}
