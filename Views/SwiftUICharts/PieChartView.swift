//
//  PieChartView.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 19.07.2024.
//


import SwiftUI

public struct PieChartView: View {
    public var data: [(value: Double, color: Color)]
    public var totalExpenses: Double
    public var style: ChartStyle
    public var formSize: CGSize
    public var dropShadow: Bool
    
    public init(data: [(value: Double, color: Color)], totalExpenses: Double, style: ChartStyle = Styles.pieChartStyleOne, form: CGSize? = ChartForm.medium, dropShadow: Bool? = true) {
        self.data = data
        self.totalExpenses = totalExpenses
        self.style = style
        self.formSize = form!
        self.dropShadow = dropShadow!
    }
    
    public var body: some View {
        ZStack {
            PieChartRow(data: data, backgroundColor: self.style.backgroundColor, accentColor: self.style.accentColor)
                .foregroundColor(self.style.accentColor)
                .padding(12)
                .frame(width: self.formSize.width, height: self.formSize.height)
            
            Circle()
                .fill(self.style.backgroundColor) // Фон внутреннего кольца
                .frame(width: self.formSize.width * 0.6, height: self.formSize.height * 0.6) // Размер кольца (60% от диаграммы)
                .overlay(
                    Text(String(format: "%.0f ₽", totalExpenses))
                        .font(.title)
                        .foregroundColor(self.style.textColor)
                        .padding(8)
                )
                .overlay(
                    Circle()
                        .stroke(self.style.accentColor, lineWidth: 2) // Рамка кольца
                        .frame(width: self.formSize.width * 0.6, height: self.formSize.height * 0.6)
                )
        }
        .frame(width: self.formSize.width, height: self.formSize.height)
    }
}


////#if DEBUG
////struct PieChartView_Previews : PreviewProvider {
////    static var previews: some View {
////        PieChartView(data:[56,78,53,65,54])
////    }
////}
////#endif

