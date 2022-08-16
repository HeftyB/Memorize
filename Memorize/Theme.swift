//
//  Theme.swift
//  Memorize
//
//  Created by Andrew Shields on 8/15/22.
//

import Foundation


struct Theme<Content> where Content: Hashable {
    var name: ThemeName
    var content: [Content: Content]
    var color: ThemeColor
}


enum Difficulty: String, CaseIterable, Identifiable {
    case easy, medium, hard, expert
    
    var id: String { self.rawValue }
}

enum ThemeColor {
    case yellow, blue, green, purple
}

enum ThemeName: String, CaseIterable, Identifiable {
    case vehicles, animals, food, flags
    
    var id: String { self.rawValue }
}
