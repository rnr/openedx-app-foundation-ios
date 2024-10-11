//
//  CGColorExtension.swift
//  OExFoundation
//
//  Created by Ivan Stepanok on 07.10.2024.
//

import Foundation
import SwiftUI

public extension CGColor {
    var hexString: String? {
        guard let components = self.components, components.count >= 3 else {
            return nil
        }
        let red = components[0]
        let green = components[1]
        let blue = components[2]
        let hexString = String(
            format: "#%02lX%02lX%02lX",
            lroundf(Float(red * 255)),
            lroundf(Float(green * 255)),
            lroundf(Float(blue * 255))
        )
        return hexString
    }
}

public extension Color {
    func uiColor() -> UIColor {
        return UIColor(self)
    }
}
