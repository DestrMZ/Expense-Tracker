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
    
    case accountingAndLegalFees = "Accountiong and legal fees"
    case bankFees = "Bank fees"
    case consultantAndProfessionalServices = "Consultant and professional services"
    case depreciation = "Depreciation"
    case employeeBenefits = "Employee benefits"
    case employeeExpenses = "Employee expenses"
    case entertainment = "Entertainment"
    case food = "Food"
    case gifts = "Gifts"
    case health = "Health"
    case insurance = "Insurance"
    case learning = "Learing"
    case licensingFees = "Licensing fees"
    case marketing = "Marketing"
    case membershipFees = "Membership fees"
    case officeSupplies = "Office supplies"
    case payroll = "Payroll"
    case repair = "Repair"
    case rent = "Rent"
    case interest = "Interest"
    case rentOrMortgagePayment = "Rent or mortgage payment"
    case software = "Software"
    case tax = "Tax"
    case travel = "Travel"
    case utilities = "Utilities"
    
    
    var systemNameIcon: String {
        switch self {
        case .insurance: return "shield"
        case .utilities: return "drop"
        case .marketing: return "megaphone"
        case .bankFees: return "creditcard"
        case .officeSupplies: return "folder"
        case .payroll: return "dollarsign.circle"
        case .employeeBenefits: return "person.2.square.stack"
        case .employeeExpenses: return "briefcase"
        case .food: return "bag.circle"
        case .licensingFees: return "cart"
        case .repair: return "wrench"
        case .travel: return "airplane"
        case .accountingAndLegalFees: return "scalemass"
        case .gifts: return "gift"
        case .rent: return "house"
        case .learning: return "book"
        case .entertainment: return "film"
        case .interest: return "percent"
        case .health: return "heart"
        case .membershipFees: return "person.2"
        case .consultantAndProfessionalServices: return "briefcase.fill"
        case .depreciation: return "arrow.down.doc"
        case .rentOrMortgagePayment: return "house.fill"
        case .software: return "app.fill"
        case .tax: return "scalemass.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .accountingAndLegalFees: return Color(red: 0.95, green: 0.27, blue: 0.27)
        case .bankFees: return Color(red: 0.23, green: 0.53, blue: 0.77)
        case .consultantAndProfessionalServices: return Color(red: 0.36, green: 0.78, blue: 0.36)
        case .depreciation: return Color(red: 0.97, green: 0.67, blue: 0.24)
        case .employeeBenefits: return Color(red: 0.58, green: 0.38, blue: 0.86)
        case .employeeExpenses: return Color(red: 0.93, green: 0.39, blue: 0.69)
        case .entertainment: return Color(red: 0.97, green: 0.84, blue: 0.38)
        case .food: return Color(red: 0.36, green: 0.78, blue: 0.36)
        case .gifts: return Color(red: 0.95, green: 0.27, blue: 0.27)
        case .health: return Color(red: 0.53, green: 0.23, blue: 0.77)
        case .insurance: return Color(red: 0.97, green: 0.67, blue: 0.24)
        case .learning: return Color(red: 0.58, green: 0.38, blue: 0.86)
        case .licensingFees: return Color(red: 0.93, green: 0.39, blue: 0.69)
        case .marketing: return Color(red: 0.97, green: 0.84, blue: 0.38)
        case .membershipFees: return Color(red: 0.36, green: 0.78, blue: 0.36)
        case .officeSupplies: return Color(red: 0.95, green: 0.27, blue: 0.27)
        case .payroll: return Color(red: 0.23, green: 0.53, blue: 0.77)
        case .repair: return Color(red: 0.97, green: 0.67, blue: 0.24)
        case .rent: return Color(red: 0.58, green: 0.38, blue: 0.86)
        case .interest: return Color(red: 0.93, green: 0.39, blue: 0.69)
        case .rentOrMortgagePayment: return Color(red: 0.97, green: 0.84, blue: 0.38)
        case .software: return Color(red: 0.36, green: 0.78, blue: 0.36)
        case .tax: return Color(red: 0.95, green: 0.27, blue: 0.27)
        case .travel: return Color(red: 0.23, green: 0.53, blue: 0.77)
        case .utilities: return Color(red: 0.97, green: 0.67, blue: 0.24)
        }
    }
}
