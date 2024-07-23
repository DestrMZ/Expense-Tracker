//
//  LogListViewModel.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 16.07.2024.
//

import FirebaseFirestore
import Foundation
import Observation

/**
 ViewModel для управления списком записей о расходах.

 `LogListViewModel` отвечает за сортировку, фильтрацию и представление формы добавления/редактирования записей.
 */
@Observable
class LogListViewModel {
    
    /// Менеджер базы данных для взаимодействия с Firestore
    let db = DatabaseManager.shared
    
    /// Тип сортировки для записей (дата, сумма, имя)
    var sortType = SortType.date
    
    /// Порядок сортировки (по возрастанию или по убыванию)
    var sortOrder = SortOrder.descending
    
    /// Набор выбранных категорий для фильтрации записей
    var selectedCategories = Set<Category>()
    
    /// Флаг, указывающий, представлена ли форма добавления/редактирования записи
    var isLogFormPresented = false
    
    /// Запись о расходах для редактирования
    var logToEdit: ExpensesLog?
    
    /// Массив предикатов для запроса в базу данных, основанный на выбранных фильтрах и сортировке
    var predicates: [QueryPredicate] {
        var predicates = [QueryPredicate]()
        if selectedCategories.count > 0 {
            predicates.append(.whereField("category", isIn: Array(selectedCategories).map { $0.rawValue }))
        }
        
        predicates.append(.order(by: sortType.rawValue, descending: sortOrder == .descending ? true : false))
        return predicates
    }
}
