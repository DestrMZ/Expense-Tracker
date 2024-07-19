//
//  ExpensesViewModel.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 18.07.2024.
//

import Combine
import FirebaseFirestore
import Firebase

class ExpensesViewModel: ObservableObject {
    @Published var totalExpense: Double?
    @Published var categorySum: [CategorySum] = []
    
    private var db = DatabaseManager.shared
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchExpensesLogs()
    }
    
    func fetchExpensesLogs() {
        db.logsCollection.addSnapshotListener { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }
            
            let logs: [ExpensesLog] = querySnapshot?.documents.compactMap { document in
                try? document.data(as: ExpensesLog.self)
            } ?? []
            
            self.calculateSums(from: logs)
        }
    }
    
    private func calculateSums(from logs: [ExpensesLog]) {
        self.totalExpense = logs.reduce(0) { $0 + $1.amount }
        
        let sums = Dictionary(grouping: logs, by: { $0.categoryEnum })
            .compactMap { (category: Category?, logs: [ExpensesLog]) -> CategorySum? in
                guard let category = category else { return nil }
                let sum = logs.reduce(0) { $0 + $1.amount }
                return CategorySum(sum: sum, category: category)
            }
        
        self.categorySum = sums.sorted { ($0.sum ?? 0) > ($1.sum ?? 0) }
    }
}
