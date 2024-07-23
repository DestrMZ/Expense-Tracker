//
//  Sort.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 16.07.2024.
//

import Foundation

/**
 Перечисление типов сортировки для расходов.

 `SortType` используется для указания типа сортировки: по дате, сумме или названию.
 */
enum SortType: String, Identifiable, CaseIterable {
    
    /// Уникальный идентификатор типа сортировки
    var id: Self { self }
    
    /// Сортировка по дате
    case date
    /// Сортировка по сумме
    case amount
    /// Сортировка по названию
    case name

    /// Системное имя иконки, связанное с типом сортировки
    var systemNameIcon: String {
        switch self {
        case .date:
            return "calendar"
        case .amount:
            return "dollarsign.circle"
        case .name:
            return "a"
        }
    }
}

/**
 Перечисление порядков сортировки для расходов.

 `SortOrder` используется для указания порядка сортировки: по возрастанию или убыванию.
 */
enum SortOrder: String, Identifiable, CaseIterable {
    
    /// Уникальный идентификатор порядка сортировки
    var id: Self { self }
    
    /// Сортировка по возрастанию
    case ascending
    /// Сортировка по убыванию
    case descending
}
