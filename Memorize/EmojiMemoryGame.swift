//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Andrew Shields on 4/18/22.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    let emo = Emoji()
            
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var themeName: ThemeName

    var difficulty: Difficulty
    
    var currSelect: String? {
        model.currSelect
    }
    
    var totalPoints: Int {
        model.totalPoints
    }
    
    var isMatch: Bool {
        model.isMatch
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    typealias Theme = MemoryGame<String>.Theme
    
    init() {
        difficulty = .easy
        themeName = .animals
    }
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(theme: Theme(name: .animals, content: Emoji().animals, color: .green), difficulty: .easy)
    }
    
    func themeBuilder(_ themeName: ThemeName) -> Theme {
        var t: Theme
        
        switch themeName {
        case .vehicles:
            t = Theme(name: .animals, content: emo.animals, color: .green)
            print("H")
        case .animals:
            t = Theme(name: .animals, content: emo.animals, color: .green)
        case .food:
            t = Theme(name: .food, content: emo.food, color: .blue)
        case .flags:
            t = Theme(name: .flags, content: emo.flags, color: .yellow)
        }
        
        return t
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        let t: Theme = themeBuilder(themeName)
        
        model = MemoryGame<String>(theme: t, difficulty: difficulty)
    }
    
    func customGame(diff: Difficulty, tName: ThemeName) {
        difficulty = diff
        themeName = tName
//        newGame()
        model = MemoryGame<String>(theme: themeBuilder(tName), difficulty: diff)
    }
}
   
