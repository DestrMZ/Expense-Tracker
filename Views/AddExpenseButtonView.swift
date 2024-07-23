//
//  AddExpressButtonView.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 19.07.2024.
//

import SwiftUI

struct AddExpenseButtonView: View {
    @Binding var isPresented: Bool

    var body: some View {
        Button(action: {
            isPresented = true
        }) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
                .shadow(radius: 10)
        }
        .padding()
    }
}

#Preview {
    AddExpenseButtonView(isPresented: .constant(false))
}
