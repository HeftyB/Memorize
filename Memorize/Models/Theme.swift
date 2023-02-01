//
//  Theme.swift
//  Memorize
//
//  Created by Andrew Shields on 1/10/23.
//

import Foundation

struct Theme: Codable, Hashable, Identifiable {
    let id: Int
    var name: String
    var content: String
    var cardCount: Int
    var color: RGBAColor
}
