//
//  ExpensesLog.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 16.07.2024.
//


import Foundation

/**
 Структура для хранения информации о расходах.

 `ExpensesLog` представляет собой запись о расходе, включающую уникальный идентификатор, название, категорию, сумму, валюту и дату.
 */
struct ExpensesLog: Codable, Identifiable, Equatable {
    
    /// Уникальный идентификатор записи о расходе
    let id: String
    /// Название расхода
    var name: String
    /// Категория расхода в виде строки
    var category: String
    /// Сумма расхода
    var amount: Double
    /// Валюта расхода, по умолчанию "RUB"
    var currency: String
    /// Дата расхода
    var date: Date
    
    /// Категория расхода в виде перечисления `Category`
    var categoryEnum: Category {
        Category(rawValue: category) ?? .educationRU
    }
    
    /**
     Инициализатор для создания новой записи о расходе.
     
     - Parameters:
       - id: Уникальный идентификатор записи о расходе.
       - name: Название расхода.
       - category: Категория расхода в виде строки.
       - amount: Сумма расхода.
       - currency: Валюта расхода, по умолчанию "RUB".
       - date: Дата расхода.
     */
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
    
    /// Текстовое представление даты расхода
    var dateText: String {
        Utils.dateFormatter.localizedString(for: date, relativeTo: Date())
    }
    
    /// Текстовое представление суммы расхода с учетом валюты
    var amountText: String {
        Utils.numberFormatter.currencySymbol = currency
        return Utils.numberFormatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
    }
}
