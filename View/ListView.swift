//
//  ListView.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 16.07.2024.
//


import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var showAddNewSheet = false
    @State private var totalExpenses: Double?
    
    var body: some View {
        NavigationView {
            VStack {
                
                if totalExpenses != nil {
//                    Text(totalExpenses)
                }
                
                
                if listViewModel.items.isEmpty {
                    Text("No expenses added yet.")
                        .font(.title)
                        .padding()
                } else {
                    List {
                        ForEach(listViewModel.items) { item in
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text("Amount: \(item.amount, specifier: "%.2f")")
                                Text("Date: \(item.date, style: .date)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .navigationTitle("Expense Tracker")
            .navigationBarItems(
                trailing: Button(action: {
                    showAddNewSheet.toggle()
                }) {
                    Text("Add")
                }
            )
            .sheet(isPresented: $showAddNewSheet) {
                AddNewExpenseView()
                    .environmentObject(listViewModel)
            }
        }
    }
}


#Preview {
    NavigationView {
        ListView()
            .environmentObject(ListViewModel())
    }
}
