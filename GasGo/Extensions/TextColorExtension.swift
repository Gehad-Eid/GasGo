//
//  TextColorExtension.swift
//  GasGo
//
//  Created by Gehad Eid on 01/03/2024.
//

import SwiftUI

extension Color {
    func isDarkColor() -> Bool {
        let components = UIColor(self).cgColor.components
        let redBrightness = components?[0] ?? 0
        let greenBrightness = components?[1] ?? 0
        let blueBrightness = components?[2] ?? 0
        
        // Algorithm to calculate luminance
        let brightness = (0.299 * redBrightness + 0.587 * greenBrightness + 0.114 * blueBrightness)
        
        return brightness < 0.75
    }
    
    func contrastingTextColor() -> Color {
        return self.isDarkColor() ? .white : .black
    }
}
