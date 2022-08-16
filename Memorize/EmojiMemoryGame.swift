//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Andrew Shields on 4/18/22.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    private let emo = Emoji()
            
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var themeName: ThemeName

    var difficulty: Difficulty
    
    var currSelect: String? { model.currSelect }
    
    var totalPoints: Int { model.totalPoints }
    
    var isMatch: Bool { model.isMatch }
    
    var cards: Array<MemoryGame<String>.Card> { model.cards }
    
    var cardColor: ThemeColor
    
    init() {
        difficulty = .easy
        themeName = .animals
        cardColor = .green
    }
    
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let t = Theme<String>(name: .animals, content: Emoji().animals, color: .green)
        return MemoryGame<String>(cardContent: t.content, difficulty: .easy)
    }
    
    func themeBuilder(_ themeName: ThemeName) -> Theme<String> {
        var t: Theme<String>
        
        switch themeName {
        case .vehicles:
            t = Theme(name: .vehicles, content: emo.vehicles, color: .purple)
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
        let t = themeBuilder(ThemeName.allCases.randomElement()!)
        themeName = t.name
        cardColor = t.color
        model = MemoryGame<String>(cardContent: t.content, difficulty: difficulty)
    }
    
    func customGame(diff: Difficulty, tName: ThemeName) {
        let t = themeBuilder(tName)
        difficulty = diff
        themeName = t.name
        cardColor = t.color
        model = MemoryGame<String>(cardContent: t.content, difficulty: diff)
    }
}
   
