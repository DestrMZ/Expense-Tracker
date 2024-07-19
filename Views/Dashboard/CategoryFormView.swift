//
//  CategoryView.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 19.07.2024.
//

import SwiftUI

struct CategoryFormView: View {
    
    let category: Category
    let sum: Double
    
    var body: some View {
        
        HStack {
            CategoryImageView(category: category)
            Text(category.rawValue.capitalized)
            Spacer()
            Text(String(format: "%.0f RUB", sum)).font(.headline)
        }
        
        
    }
}

#Preview {
    CategoryFormView(category: .carRU, sum: 2200)
}
