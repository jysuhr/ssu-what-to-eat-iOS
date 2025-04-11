//
//  UIColor++.swift
//  WhatToEat-iOS
//
//  Created by 서준영 on 4/12/25.
//

import SwiftUI

extension Color {
    init(hex: String, alpha: Double = 1.0) {
        let hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
                                .replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r = Double((rgb & 0xFF0000) >> 16) / 255
        let g = Double((rgb & 0x00FF00) >> 8) / 255
        let b = Double(rgb & 0x0000FF) / 255

        self.init(.sRGB, red: r, green: g, blue: b, opacity: alpha)
    }
}
