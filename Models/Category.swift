//
//  Category.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 16.07.2024.
//

import Foundation
import SwiftUI

enum Category: String, Identifiable, CaseIterable {
    
    var id: Self { self }
        case healthRU = "Health"
        case leisureRU = "Leisure"
        case houseRU = "House"
        case cafeRU = "Cafe"
        case educationRU = "Education"
        case presentRU = "Present"
        case productsRU = "Product"
        case familyRU = "Family"
        case sportRU = "Sport"
        case transportRU = "Transport"
        case carRU = "Personal car"
        case otherRU = "Other"
    
    
//    case healthRU = "Здоровье"
//    case leisureRU = "Досуг"
//    case houseRU = "Дом"
//    case cafeRU = "Кафе"
//    case educationRU = "Образование"
//    case presentRU = "Подарки"
//    case productsRU = "Продукты"
//    case familyRU = "Семья"
//    case sportRU = "Спорт"
//    case transportRU = "Транспорт"
//    case carRU = "Личное авто"
//    case otherRU = "Другое"
    
    
    var systemNameIcon: String {
        switch self {
        case .healthRU:
            return "heart.fill"
        case .leisureRU:
            return "gamecontroller.fill"
        case .houseRU:
            return "house.fill"
        case .cafeRU:
            return "cup.and.saucer.fill"
        case .educationRU:
            return "book.fill"
        case .presentRU:
            return "gift.fill"
        case .productsRU:
            return "cart.fill"
        case .familyRU:
            return "person.3.fill"
        case .sportRU:
            return "sportscourt.fill"
        case .transportRU:
            return "bus.fill"
        case .carRU:
            return "car.fill"
        case .otherRU:
            return "ellipsis.circle.fill"
            
//        case .healthRU:
//            return "heart.fill"
//        case .leisureRU:
//            return "gamecontroller.fill"
//        case .houseRU:
//            return "house.fill"
//        case .cafeRU:
//            return "cup.and.saucer.fill"
//        case .educationRU:
//            return "book.fill"
//        case .presentRU:
//            return "gift.fill"
//        case .productsRU:
//            return "cart.fill"
//        case .familyRU:
//            return "person.3.fill"
//        case .sportRU:
//            return "sportscourt.fill"
//        case .transportRU:
//            return "bus.fill"
//        case .carRU:
//            return "car.fill"
//        case .otherRU:
//            return "ellipsis.circle.fill"
            
        }
    }
    
    var color: Color {
        switch self {
            
        case .healthRU:
            return Color(red: 0.49, green: 0.18, blue: 0.56) // Фиолетовый
        case .leisureRU:
            return Color(red: 0.12, green: 0.73, blue: 0.55) // Зеленый
        case .houseRU:
            return Color(red: 0.91, green: 0.30, blue: 0.24) // Красный
        case .cafeRU:
            return Color(red: 0.94, green: 0.76, blue: 0.19) // Желтый
        case .educationRU:
            return Color(red: 0.22, green: 0.40, blue: 0.79) // Синий
        case .presentRU:
            return Color(red: 0.96, green: 0.26, blue: 0.57) // Розовый
        case .productsRU:
            return Color(red: 0.57, green: 0.28, blue: 0.64) // Фиолетовый
        case .familyRU:
            return Color(red: 0.16, green: 0.50, blue: 0.73) // Голубой
        case .sportRU:
            return Color(red: 0.98, green: 0.41, blue: 0.07) // Оранжевый
        case .transportRU:
            return Color(red: 0.58, green: 0.65, blue: 0.65) // Серый
        case .carRU:
            return Color(red: 0.29, green: 0.63, blue: 0.34) // Зеленый
        case .otherRU:
            return Color(red: 0.80, green: 0.50, blue: 0.20) // Коричневый
            
            
//        case .accountingAndLegalFees: return Color(red: 0.95, green: 0.27, blue: 0.27)
//        case .bankFees: return Color(red: 0.23, green: 0.53, blue: 0.77)
//        case .consultantAndProfessionalServices: return Color(red: 0.36, green: 0.78, blue: 0.36)
//        case .depreciation: return Color(red: 0.97, green: 0.67, blue: 0.24)
//        case .employeeBenefits: return Color(red: 0.58, green: 0.38, blue: 0.86)
//        case .employeeExpenses: return Color(red: 0.93, green: 0.39, blue: 0.69)
//        case .entertainment: return Color(red: 0.97, green: 0.84, blue: 0.38)
//        case .food: return Color(red: 0.36, green: 0.78, blue: 0.36)
//        case .gifts: return Color(red: 0.95, green: 0.27, blue: 0.27)
//        case .health: return Color(red: 0.53, green: 0.23, blue: 0.77)
//        case .insurance: return Color(red: 0.97, green: 0.67, blue: 0.24)
//        case .learning: return Color(red: 0.58, green: 0.38, blue: 0.86)
//        case .licensingFees: return Color(red: 0.93, green: 0.39, blue: 0.69)
//        case .marketing: return Color(red: 0.97, green: 0.84, blue: 0.38)
//        case .membershipFees: return Color(red: 0.36, green: 0.78, blue: 0.36)
//        case .officeSupplies: return Color(red: 0.95, green: 0.27, blue: 0.27)
//        case .payroll: return Color(red: 0.23, green: 0.53, blue: 0.77)
//        case .repair: return Color(red: 0.97, green: 0.67, blue: 0.24)
//        case .rent: return Color(red: 0.58, green: 0.38, blue: 0.86)
//        case .interest: return Color(red: 0.93, green: 0.39, blue: 0.69)
//        case .rentOrMortgagePayment: return Color(red: 0.97, green: 0.84, blue: 0.38)
//        case .software: return Color(red: 0.36, green: 0.78, blue: 0.36)
//        case .tax: return Color(red: 0.95, green: 0.27, blue: 0.27)
//        case .travel: return Color(red: 0.23, green: 0.53, blue: 0.77)
//        case .utilities: return Color(red: 0.97, green: 0.67, blue: 0.24)
            
        }
    }
}
