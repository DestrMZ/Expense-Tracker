import SwiftUI

struct PieSlice: Identifiable {
    var id = UUID()
    var startDeg: Double
    var endDeg: Double
    var value: Double
    var normalizedValue: Double
    var color: Color
}

public struct PieChartCell: View {
    @State private var show: Bool = false
    var rect: CGRect
    var radius: CGFloat {
        return min(rect.width, rect.height) / 2
    }
    var startDeg: Double
    var endDeg: Double
    var path: Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: self.radius, startAngle: Angle(degrees: self.startDeg), endAngle: Angle(degrees: self.endDeg), clockwise: false)
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        path.closeSubpath()
        return path
    }
    var index: Int
    var backgroundColor: Color
    var accentColor: Color
    public var body: some View {
        path
            .fill(self.accentColor)
            .overlay(path.stroke(self.backgroundColor, lineWidth: 1))
            .scaleEffect(self.show ? 1 : 0.9)  // Slightly scale up to avoid visual artifacts
            .animation(Animation.spring().delay(Double(self.index) * 0.04))
            .onAppear() {
                self.show = true
            }
    }
}


