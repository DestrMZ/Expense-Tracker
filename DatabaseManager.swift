//
//  DatabaseManager.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 16.07.2024.
//

// DatabaseManager.swift

import FirebaseFirestore
import Foundation

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private init() {}
    
    private (set) lazy var logsCollection: CollectionReference = {
        Firestore.firestore().collection("logs")
    }()
    
    func add(log: ExpensesLog) throws {
        try logsCollection.document(log.id).setData(from: log)
    }
    
    func update(log: ExpensesLog) {
        logsCollection.document(log.id).updateData([
            "name": log.name,
            "amount": log.amount,
            "category": log.category,
            "date": log.date
        ])
    }
    
    func delete(log: ExpensesLog) {
        logsCollection.document(log.id).delete()
    }
}
