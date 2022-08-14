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
//
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
    
    init() {
//        theme = Theme(name: .animals, emojis: emo.animals, color: .green)
        difficulty = .easy
        themeName = .animals
    }
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>() {
            var dicts = [String:String]()
            
            while dicts.count < 4 {
                let e = Emoji().animals.randomElement()!

                if dicts[e.key] == nil {
                    dicts[e.key] = e.value
                }
            }

            return dicts
        }
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        var totalPairs: Int
        
        switch difficulty {
        case .easy:
            totalPairs = 4
        case .medium:
            totalPairs = 8
        case .hard:
            totalPairs = 10
        case .expert:
            totalPairs = 12
        }
        
        var t: Theme = Theme(name: .animals, emojis: emo.animals, color: .purple)
        
        switch themeName {
        case .vehicles:
            print("H")
//            theme = Theme(name: .vehicles, emojis: Emoji().vehicles, color: .yellow)
        case .animals:
            t = Theme(name: .animals, emojis: emo.animals, color: .green)
        case .food:
            t = Theme(name: .food, emojis: emo.food, color: .blue)
        case .flags:
            t = Theme(name: .flags, emojis: emo.flags, color: .yellow)

        }
        
        model = MemoryGame<String>() {
                var dicts = [String:String]()
                
                while dicts.count < totalPairs {
                    let e = t.emojis.randomElement()!

                    if dicts[e.key] == nil {
                        dicts[e.key] = e.value
                    }
                }

                return dicts
            }
    }
    
    func customGame(diff: Difficulty, tName: ThemeName) {
        difficulty = diff
        themeName = tName
        newGame()
    }
}


struct Theme {
    var name: ThemeName
    var emojis: Dictionary<String,String>
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
   
