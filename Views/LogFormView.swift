//
//  LogFormView.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 17.07.2024.
//

import SwiftUI

struct LogFormView: View {
    
    @StateObject var vm: FormViewModel
    @Environment(\.dismiss) var dismiss
    
    #if !os(macOS)
    
    var title: String {
        ((vm.logToEdit == nil) ? "Добавить" : "Редактировать") + " расходы"
    }
    
    var body: some View {
        NavigationView {
            formView
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Сохранить") {
                            self.onSaveTapped()
                        }
                        .disabled(vm.isSaveButtonDisable)
                    }
                    
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Отмена") {
                            self.onCancelTapped()
                        }
                    }
                    
                }
                .navigationBarTitle(title, displayMode: .inline)
        }
    }
    #else
        
    var body: some View {
        VStack {
            formView.padding()
            HStack {
                Button("Cancel") {
                    self.onCancelTapped()
                }
                
                Button("Save") {
                    self.onSaveTapped()
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .disabled(vm.isSaveButtonDisable)
            }
            .padding()
        }
        .frame(minWidth: 300)
    }
    
    #endif
    
    private var formView: some View {
        
        Form {
            TextField("Name", text: $vm.name)
                .disableAutocorrection(true)
            TextField("Amount", value: $vm.amount, formatter: vm.numberFormatter)
            
            #if !os(macOS)
                .keyboardType(.numbersAndPunctuation)
            #endif
            
            Picker(selection: $vm.category, label: Text("Category")) {
                ForEach(Category.allCases) { category in
                    Text(category.rawValue.capitalized).tag(category)
                }
            }
            
            DatePicker(selection: $vm.date, displayedComponents: [.date, .hourAndMinute]) {
                Text("Date")
            }
        }
    }
    
    private func onCancelTapped() {
        self.dismiss()
    }
    
    private func onSaveTapped() {
        #if !os(macOS)
        UIApplication.shared
            .sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        #endif
        vm.save()
        self.dismiss()
    }
    
    
}

#Preview {
    LogFormView(vm: .init())
}
