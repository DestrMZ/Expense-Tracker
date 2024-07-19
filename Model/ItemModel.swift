//
//  ItemModel.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 16.07.2024.
//
//    1.    Создание модели данных (ItemModel):
//    •    Определим модель данных для хранения информации о расходах.
//    2.    Создание ViewModel (ListViewModel):
//    •    ViewModel будет содержать логику управления списком расходов.
//    3.    Создание View (ListView):
//    •    Интерфейс для отображения списка расходов и добавления новых расходов.

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let amount: Double
    let date: Date
    
    init(id: String = UUID().uuidString, title: String, amount: Double, date: Date) {
        self.id = id
        self.title = title
        self.amount = amount
        self.date = date
    }
}
