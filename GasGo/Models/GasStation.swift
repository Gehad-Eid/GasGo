//
//  Station.swift
//  GasGo
//
//  Created by Gehad Eid on 01/03/2024.
//

import Foundation

struct GasStation {
    let id: String
    let name: String
    let location: String
    var services: [Service]
    var isFavorite: Bool = false
    var rating: Int = 0
}
