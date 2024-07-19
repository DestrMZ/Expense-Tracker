//
//  ListViewModel.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 16.07.2024.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    private let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }

    func addItem(title: String, amount: Double, date: Date) {
        let newItem = ItemModel(title: title, amount: amount, date: date)
        items.append(newItem)
    }
    
    func deleteItem(at offset: IndexSet) {
        items.remove(atOffsets: offset)
    }
    
    private func saveItems() {
        if let encodeDate = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeDate, forKey: itemsKey)
        }
    }
    
}
