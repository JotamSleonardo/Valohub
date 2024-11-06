//
//  ColorExt.swift
//  ValoHub
//
//  Created by Jotam Leonardo on 11/3/24.
//

import SwiftUI

extension Color {
    init(hex: String) {
        var hexFormatted = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted.removeFirst()
        }

        var rgba: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgba)

        let red = Double((rgba >> 24) & 0xFF) / 255.0
        let green = Double((rgba >> 16) & 0xFF) / 255.0
        let blue = Double((rgba >> 8) & 0xFF) / 255.0
        let alpha = Double(rgba & 0xFF) / 255.0

        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }

    func darker(by percentage: Double) -> Color {
        let amount = 1 - min(max(percentage, 0), 100) / 100
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var opacity: CGFloat = 0

        UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &opacity)

        return Color(
            .sRGB,
            red: Double(red * amount),
            green: Double(green * amount),
            blue: Double(blue * amount),
            opacity: Double(opacity)
        )
    }
}
