//
//  LogListViewModel.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 16.07.2024.
//

import FirebaseFirestore
import Foundation
import Observation

@Observable
class LogListViewModel {
    
    let db = DatabaseManager.shared
    
    var sortType = SortType.date
    var sortOrder = SortOrder.descending
    var selectedCategories = Set<Category>()
    var isLogFormPresented = false
    var logToEdit: ExpensesLog?
    
    
    var predicates: [QueryPredicate] {
        var predicates = [QueryPredicate]()
        if selectedCategories.count > 0 {
            predicates.append(.whereField("category", isIn: Array(selectedCategories).map { $0.rawValue }))
        }
        
        predicates.append(.order(by: sortType.rawValue, descending: sortOrder == .descending ? true : false))
        return predicates
    }
}

