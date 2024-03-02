//
//  ButtonType.swift
//  GasGo
//
//  Created by Gehad Eid on 01/03/2024.
//

import SwiftUI

enum ButtonType {
    case apple, fav, prime, sub
    
    var backgroundColor: Color {
        switch self {
        case .apple: return .black
        case .fav: return Color(hex: "FF9C41")
        case .prime: return Color(hex: "004871")
        case .sub: return .green
        }
    }
}
