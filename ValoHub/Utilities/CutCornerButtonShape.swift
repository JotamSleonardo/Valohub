//
//  CutCornerButtonShape.swift
//  ValoHub
//
//  Created by Jotam Leonardo on 11/2/24.
//

import SwiftUI
import PureSwiftUI

public struct CutCornerShape: Shape {
    var cutSize: CGFloat = 20

    public func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: cutSize, y: 0)) // Start at top-left with a cut
        path.addLine(to: CGPoint(x: rect.width, y: 0)) // Top edge
        path.addLine(to: CGPoint(x: rect.width, y: rect.height - cutSize)) // Right edge with cut
        path.addLine(to: CGPoint(x: rect.width - cutSize, y: rect.height)) // Bottom-right cut
        path.addLine(to: CGPoint(x: 0, y: rect.height)) // Bottom edge
        path.addLine(to: CGPoint(x: 0, y: cutSize)) // Left edge with cut
        path.closeSubpath()

        return path
    }
}

private let arrowLayoutConfig = LayoutGuideConfig.grid(columns: [0, 0.1, 0.2, 0.3, 1], rows: 10)
private let storkeStyle = StrokeStyle(lineWidth: 1, lineJoin: .round)

public struct AgentCardShape: Shape {
    public func path(in rect: CGRect) -> Path {
        var path = Path()

        // Start from the upper left with a rounded corner
        path.move(to: CGPoint(x: rect.minX, y: rect.minY + 20))
        path.addQuadCurve(
            to: CGPoint(x: rect.minX + 10, y: rect.minY),
            control: CGPoint(x: rect.minX, y: rect.minY)
        )

        // Draw a slightly diagonal line to the upper right corner
        path.addLine(to: CGPoint(x: rect.maxX - 30, y: rect.minY + 15))
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX, y: rect.minY + 40),
            control: CGPoint(x: rect.maxX, y: rect.minY + 20)
        )

        // Draw a line down to the pointed lower right corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - 5))

        // Draw a rounded corner from the lower right to the lower left
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX - 10, y: rect.maxY),
            control: CGPoint(x: rect.maxX, y: rect.maxY)
        )

        path.addLine(to: CGPoint(x: rect.minX + 40, y: rect.maxY))

        path.addQuadCurve(
            to: CGPoint(x: rect.minX, y: rect.maxY - 40),
            control: CGPoint(x: rect.minX, y: rect.maxY)
        )

        // Close the path by connecting back to the starting point
        path.closeSubpath()

        return path
    }
}

#Preview {
    AgentCardShape()
        .stroke(style: storkeStyle)
        .layoutGuide(arrowLayoutConfig)
        .showLayoutGuides(true)
        .frame(width: 300, height: 400)

}
