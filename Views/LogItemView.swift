//
//  LogItemView.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 17.07.2024.
//

import SwiftUI

struct LogItemView: View {
    
    let log: ExpensesLog
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        switch horizontalSizeClass {
        case .compact: compactView
        default: regularView
        }
    }
    
    var compactView: some View {
        HStack(spacing: 16) {
            CategoryImageView(category: log.categoryEnum)
            VStack(alignment: .leading, spacing: 8) {
                Text(log.name).font(.headline)
                Text(log.dateText).font(.subheadline)
            }
            Spacer()
            Text(log.amountText).font(.headline)
        }
    }
    
    
    var regularView: some View {
        HStack(spacing: 16) {
            CategoryImageView(category: log.categoryEnum)
            Spacer()
            Text(log.name)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer()
            Text(log.amountText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer()
            Text(log.dateText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer()
            Text(log.categoryEnum.rawValue)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
    }
}

#Preview {
    VStack {
        ForEach([
            ExpensesLog(id: "1", name: "Sushi", category: "Food", amount: 150, date: .now),
            ExpensesLog(id: "2", name: "Electricity", category: "House", amount: 1000, date: .now)
        ]) { log in LogItemView(log: log)}
    }
    .padding()
}
