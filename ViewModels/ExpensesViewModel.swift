//
//  ExpensesViewModel.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 18.07.2024.
//

import Combine
import FirebaseFirestore
import Firebase

/**
 ViewModel для управления данными о расходах.

 `ExpensesViewModel` отвечает за получение данных о расходах из базы данных и их обработку для отображения в представлении.
 */
class ExpensesViewModel: ObservableObject {
    
    /// Общая сумма всех расходов
    @Published var totalExpense: Double?
    
    /// Суммы расходов по категориям
    @Published var categorySum: [CategorySum] = []
    
    /// Менеджер базы данных для взаимодействия с Firestore
    private var db = DatabaseManager.shared
    
    /// Набор для хранения подписок Combine
    private var cancellables = Set<AnyCancellable>()
    
    /// Инициализатор, вызывающий метод для получения данных о расходах
    init() {
        fetchExpensesLogs()
    }
    
    /**
     Метод для получения данных о расходах из Firestore.
     
     Использует `addSnapshotListener` для прослушивания изменений в коллекции расходов и обновляет данные по мере их поступления.
     */
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
    
    /**
     Метод для вычисления общих сумм расходов и сумм по категориям.
     
     - Parameter logs: Массив записей о расходах.
     
     Вычисляет общую сумму всех расходов и суммы по каждой категории, затем обновляет соответствующие свойства.
     */
    private func calculateSums(from logs: [ExpensesLog]) {
        self.totalExpense = logs.reduce(0) { $0 + $1.amount }
        
        let sums = Dictionary(grouping: logs, by: { $0.categoryEnum })
            .compactMap { (category: Category?, logs: [ExpensesLog]) -> CategorySum? in
                guard let category = category else { return nil }
                let sum = logs.reduce(0) { $0 + $1.amount }
                return CategorySum(sum: sum, category: category)
            }
        
        self.categorySum = sums.sorted { ($0.sum) > ($1.sum) }
    }
}
