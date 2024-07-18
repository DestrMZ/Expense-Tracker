//
//  Utils.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 16.07.2024.
//

import Foundation

struct Utils {
    
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
    }()
    
    static var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.isLenient = true
        formatter.numberStyle = .currency
        return formatter
    }()
}
