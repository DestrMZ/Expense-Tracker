//
//  ExpensesLog.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 16.07.2024.
//

import Foundation

struct ExpensesLog: Codable, Identifiable, Equatable {
    
    let id: String
    var name: String
    var category: String
    var amount: Double
    var currency: String
    var date: Date
    
    var categoryEnum: Category {
        Category(rawValue: category) ?? .food
    }
    
    init(id: String, name: String, category: String, amount: Double, currency: String = "RUB", date: Date) {
        self.id = id
        self.name = name
        self.category = category
        self.amount = amount
        self.currency = currency
        self.date = date
    }
    
}

extension ExpensesLog {
    
    var dateText: String {
        Utils.dateFormatter.string(from: date)
    }
    
    var amountText: String {
        Utils.numberFormatter.currencySymbol = currency
        return Utils.numberFormatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
    }
}