//
//  Sort.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 16.07.2024.
//

import Foundation

enum SortType: String, Identifiable, CaseIterable {
    
    var id: Self { self }
    case date, amount, name

    var systemNameIcon: String {
        switch self {
        case .date:
            return "calendar"
        case .amount:
            return "dollarsign.circle"
        case .name:
            return "a"
        }
    }
    
}

enum SortOrder: String, Identifiable, CaseIterable {
    
    var id: Self { self }
    case ascending, descending
}


//struct ExpenseLogSort {
//    var sortType: SortType
//    var sortOrder: SortOrder
//    
//    var isAscending: Bool {
//        sortOrder == .ascending ? true : false
//    }
//    
//    var sortDescription: NSSortDescriptor {
//        switch sortType {
//        case .date:
//            return NSSortDescriptor(keyPath: \ExpensesLog.date, ascending: isAscending)
//        case .amount:
//            return NSSortDescriptor(keyPath: \ExpensesLog.amount, ascending: isAscending)
//        case .name:
//            return NSSortDescriptor(keyPath: \ExpensesLog.name, ascending: isAscending)
//        }
//    }
//}
