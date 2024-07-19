//
//  CategoryImageView.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 17.07.2024.
//

import SwiftUI

struct CategoryImageView: View {
    
    let category: Category
    
    var body: some View {
        
        Image(systemName: category.systemNameIcon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .padding(.all, 8)
            .foregroundColor(category.color)
            .background(category.color.opacity(0.1))
            .cornerRadius(18)
        
    }
}

#Preview {
    CategoryImageView(category: .houseRU)
}
