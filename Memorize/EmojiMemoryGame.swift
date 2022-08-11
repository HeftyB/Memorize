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
    
    var theme: Theme
    
    var difficulty: Difficulty
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    init() {
        theme = Theme(name: .animals, emojis: emo.animals, color: .green)
        difficulty = .easy
    }
    
    
    
    
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(nummberOfPairsOfCards: 4) { _ in
            var dicts = [String:String]()
            let emo = Emoji().animals
            
//            return emo
            while dicts.count < 4 {
                let e = emo.randomElement()!

                if dicts[e.key] == nil {
                    dicts[e.key] = e.value
                }
            }

            return dicts
        }
//        MemoryGame<String>(nummberOfPairsOfCards: 4) { pairIndex in
//            emojis[pairIndex]
//        }
    }
    
    
    func createTestGame() {
        model = MemoryGame<String>(nummberOfPairsOfCards: 4) { _ in
            var dicts = [String:String]()
            let emo = Emoji().animals
            
//            return emo
            while dicts.count < 4 {
                let e = emo.randomElement()!

                if dicts[e.key] == nil {
                    dicts[e.key] = e.value
                }
            }

            return dicts
        }
    }
    
    
    func deckBuilder (numberOfCards: Int) -> [String:String] {
        var dicts = [String:String]()
        let emo = theme.emojis

        while dicts.count < numberOfCards {
            let e = emo.randomElement()!

            if dicts[e.key] != nil {
                dicts[e.key] = e.value
            }
        }

        return dicts
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    // newGame
    func createNewGame(themeName: ThemeName, diff: Difficulty) {
        
        let totalPairs: Int
        
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
        
        selectTheme(themeName)
        
        model = MemoryGame(nummberOfPairsOfCards: totalPairs) { _ in
            deckBuilder(numberOfCards: totalPairs)
        }
    }
    
    // select theme
    func selectTheme(_ themeName: ThemeName) {
        switch themeName {
        case .vehicles:
            print("H")
//            theme = Theme(name: .vehicles, emojis: Emoji().vehicles, color: .yellow)
        case .animals:
            theme = Theme(name: .animals, emojis: Emoji().animals, color: .green)
        case .food:
            theme = Theme(name: .food, emojis: Emoji().food, color: .blue)
        case .flags:
            theme = Theme(name: .flags, emojis: Emoji().flags, color: .yellow)
        }
    }
}
