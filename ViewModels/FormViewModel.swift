//
//  FormViewModel.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 17.07.2024.
//


import Foundation
import Observation

class FormViewModel: ObservableObject {
    
    var logToEdit: ExpensesLog?
    
    let db = DatabaseManager.shared
    
    @Published var name = ""
    @Published var amount: Double = 0
    @Published var category = Category.houseRU
    @Published var date = Date()
    
    var isSaveButtonDisable: Bool {
        name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.isLenient = true
        formatter.numberStyle = .currency
        formatter.currencyCode = "RUB"
        return formatter
    }()
    
    init(logToEdit: ExpensesLog? = nil) {
        self.logToEdit = logToEdit
        if let logToEdit {
            self.name = logToEdit.name
            self.amount = logToEdit.amount
            self.category = logToEdit.categoryEnum
            self.date = logToEdit.date
            numberFormatter.currencyCode = logToEdit.currency
        }
    }
    
    func save() {
        var log: ExpensesLog
        if let logToEdit {
            log = logToEdit
        } else {
            log = ExpensesLog(id: UUID().uuidString, name: "", category: "", amount: 0, date: .now)
        }
        
        log.name = self.name.trimmingCharacters(in: .whitespacesAndNewlines)
        log.category = self.category.rawValue
        log.amount = self.amount
        log.date = self.date
        
        if self.logToEdit == nil {
            try? db.add(log: log)
        } else {
            db.update(log: log)
        }
    }
    
    func delete(log: ExpensesLog) {
        db.delete(log: log)
    }
}

