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
    @State private var currentBalance: Double? = 43_065
    
    var body: some View {
        
        Spacer(minLength: 10)
        
        HStack {
            
            Image(systemName: "person.circle")
                .font(.largeTitle)
            
            Text("Welcome, ")
                .foregroundStyle(.gray)
                .font(.headline)
            
            Text("Ivan!")
                .bold()
                .font(.headline)
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        Divider()
        Spacer(minLength: 25)
        
        VStack(spacing: 2) {
            VStack(spacing: 4) {
                if viewModel.totalExpense != nil {
                    HStack {
                        
                        Text(String(format: "₽ %.2f", currentBalance ?? 0.0))
                            .font(.title)
                            .bold()
                            .foregroundStyle(.gray)
                        Text("Balance")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                            
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
             
            
            HStack {
                if !viewModel.categorySum.isEmpty {
                    PieChartView(
                        data: viewModel.categorySum.map { ($0.sum, $0.category.color) }, totalExpenses: viewModel.totalExpense ?? 0,
                        style: Styles.pieChartStyleOne,
                        form: CGSize(width: 300, height: 240),
                        dropShadow: false)
                }
            }.frame(width: 200, height: 250, alignment: .center)

            
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
