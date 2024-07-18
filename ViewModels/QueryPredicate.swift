//
//  QueryPredicate.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 18.07.2024.
//
//
//import Foundation
//
//enum QueryPredicate: Equatable {
//    case whereField(String, isIn: [String])
//    case order(by: String, descending: Bool)
//    
//    static func == (lhs: QueryPredicate, rhs: QueryPredicate) -> Bool {
//        switch (lhs, rhs) {
//        case (.whereField(let field1, let values1), .whereField(let field2, let values2)):
//            return field1 == field2 && values1 == values2
//        case (.order(let field1, let descending1), .order(let field2, let descending2)):
//            return field1 == field2 && descending1 == descending2
//        default:
//            return false
//        }
//    }
//}
