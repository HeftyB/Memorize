//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Andrew Shields on 4/18/22.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    let theme: Theme
    @Published private var model: MemoryGame<String>
    
    var currSelect: String? { model.currSelect }
    var totalPoints: Int { model.totalPoints }
    var isMatch: Bool { model.isMatch }
    var cards: Array<MemoryGame<String>.Card> { model.cards }
    
    init(theme: Theme) {
        var content = Set<String>()
        
        while content.count < (theme.cardCount / 2) {
            content.insert(String(theme.content.randomElement()!))
        }
        
        self.theme = theme
        model = MemoryGame(content: Array<String>(content))
    }
    
    func createMemoryGame() -> MemoryGame<String> {
        var content = Set<String>()
        
        while content.count < (theme.cardCount / 2) {
            content.insert(String(theme.content.randomElement()!))
        }
        
        return MemoryGame(content: Array<String>(content))
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = createMemoryGame()
    }
}
   
