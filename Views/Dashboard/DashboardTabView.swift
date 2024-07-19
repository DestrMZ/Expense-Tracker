//
//  DashboardTabView.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 18.07.2024.
//

import SwiftUI
import FirebaseFirestore
import Firebase

struct DashboardTabView: View {
    @StateObject private var viewModel = ExpensesViewModel()
    
    var body: some View {
        
        VStack(spacing: 0) {
            VStack(spacing: 4) {
                if viewModel.totalExpense != nil {
                    Text("Total expenses")
                        .font(.headline)
                    Text(String(format: "%.2f ₽", viewModel.totalExpense ?? "Loading..."))
                        .font(.largeTitle)
                        .padding(.vertical)
                }
            }
            
            
            
            if !viewModel.categorySum.isEmpty {
                PieChartView(
                    data: viewModel.categorySum.map { ($0.sum, $0.category.color) }, totalExpenses: viewModel.totalExpense ?? 0,
                    style: Styles.pieChartStyleOne,
                    form: CGSize(width: 300, height: 240),
                    dropShadow: false)
            }
            
            Divider()
            
            List {
                
                Text("Breakdown").font(.headline)
                ForEach(viewModel.categorySum) {
                    CategoryFormView(category: $0.category, sum: $0.sum)
                }
            }
            
            if viewModel.totalExpense == nil && !viewModel.categorySum.isEmpty {
                Text("No expenses data\nPlease add your expenses from the logs tab")
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .padding(.horizontal)
            }
            
        }
    }
    
}


struct CategorySum: Identifiable, Equatable {
    let sum: Double
    let category: Category
    
    var id: String {
        "\(category.rawValue)\(sum)"
    }
}

#Preview {
    DashboardTabView()
}

//
//VStack {
//    Text("Total Expenses: \(viewModel.totalExpense, specifier: "%.2f")")
//        .font(.headline)
//        .padding()
//    
//    List(viewModel.categorySum) { categorySum in
//        HStack {
//            Text(categorySum.category?.rawValue.capitalized ?? "Unknown")
//            Spacer()
//            Text("\(categorySum.sum ?? 0, specifier: "%.2f")")
//        }
//    }
//}
//.navigationTitle("Dashboard")
//.onAppear {
//    viewModel.fetchExpensesLogs()
//}
