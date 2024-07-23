//
//  FormViewModel.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 17.07.2024.
//

import Foundation
import Observation

/**
 ViewModel для управления формой добавления/редактирования записи о расходах.

 `FormViewModel` отвечает за обработку ввода данных пользователем и сохранение/обновление записей в базе данных.
 */
class FormViewModel: ObservableObject {
    
    /// Запись о расходах для редактирования
    var logToEdit: ExpensesLog?
    
    /// Менеджер базы данных для взаимодействия с Firestore
    let db = DatabaseManager.shared
    
    /// Название расхода
    @Published var name = ""
    
    /// Сумма расхода
    @Published var amount: Double = 0
    
    /// Категория расхода
    @Published var category = Category.houseRU
    
    /// Дата расхода
    @Published var date = Date()
    
    /// Определяет, должна ли кнопка "Сохранить" быть отключена
    var isSaveButtonDisable: Bool {
        name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    /// Форматтер для форматирования суммы в валюте
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.isLenient = true
        formatter.numberStyle = .currency
        formatter.currencyCode = "RUB"
        return formatter
    }()
    
    /**
     Инициализатор, который может принимать запись для редактирования.
     
     - Parameter logToEdit: Запись о расходах для редактирования. Если передана, инициализируются поля формы значениями этой записи.
     */
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
    
    /**
     Сохраняет или обновляет запись о расходах в базе данных.
     
     Если запись редактируется, обновляются ее поля. Если создается новая запись, она добавляется в базу данных.
     */
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
    
    /**
     Удаляет запись о расходах из базы данных.
     
     - Parameter log: Запись о расходах, которую нужно удалить.
     */
    func delete(log: ExpensesLog) {
        db.delete(log: log)
    }
}
