//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Andrew Shields on 4/18/22.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    static let emojis = [String](Emoji().animals.keys)
        
    private var totalPairs = 8
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
    
    
    
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(nummberOfPairsOfCards: totalPairs) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    
    
    
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    // newGame
    func createNewGame() {
        /// code here
    }
    
    // select theme
    func selectTheme(_ theme: String) {
        /// code here
    }
    
    // change difficulty
    func selectDifficulty (_ difficulty: Difficulty) {
        switch difficulty {
        case .easy:
            totalPairs = 8
        case .medium:
            totalPairs = 12
        case .hard:
            totalPairs = 16
        case .expert:
            totalPairs = 20
        }
    }
}
