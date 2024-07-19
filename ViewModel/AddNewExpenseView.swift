//
//  AddNewExpenseView.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 16.07.2024.
//

import SwiftUI

struct AddNewExpenseView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: ListViewModel
    
    @State private var title: String = ""
    @State private var amount: String = ""
    @State private var date: Date = Date()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
                DatePicker("Date", selection: $date, displayedComponents: .date)
            }
            .navigationTitle("Add Expense")
            .navigationBarItems(
                leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Save") {
                    if let amount = Double(amount) {
                        viewModel.addItem(title: title, amount: amount, date: date)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            )
        }
    }
}

#Preview {
    NavigationView {
        AddNewExpenseView()
            .environmentObject(ListViewModel())
    }
}
