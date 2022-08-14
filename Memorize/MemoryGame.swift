//
//  MemoryGame.swift
//  Memorize
//
//  Created by Andrew Shields on 4/18/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Hashable {
    private(set) var cards: Array<Card>
    
    private var indexOfFaceUpCard: Int?
    
    var totalPoints: Int
    var currSelect: CardContent?
    var isMatch: Bool
    var difficulty: Difficulty
    var theme: Theme
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            isMatch = false
            if let potentialMatchIndex = indexOfFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    totalPoints += 14823
                    isMatch = true
                }
                indexOfFaceUpCard = nil
                currSelect = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfFaceUpCard = chosenIndex
                currSelect = nil
            }
            
            cards[chosenIndex].isFaceUp.toggle()
            currSelect = cards[chosenIndex].description
        }
    }
       
    init(theme th: Theme, difficulty diff: Difficulty) {
        cards = Array<Card>()
        totalPoints = 0
        currSelect = nil
        isMatch = false
        theme = th
        difficulty = diff
        
        
        let content = deckBuilder()
        
        for (k,v) in content {
            cards.append(Card(content: k, description: v, id: "\(k)"))
            cards.append(Card(content: k, description: v , id: "\(k)Match"))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var flipped: Bool = false
        var content: CardContent
        var description: CardContent
        var id: String
    }
    
    struct Theme {
        var name: ThemeName
        var content: Dictionary<CardContent,CardContent>
        var color: ThemeColor
    }
    
    func deckBuilder () -> [CardContent:CardContent] {
        
        var dicts = [CardContent:CardContent]()
        let emo = theme.content
        
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

        while dicts.count < totalPairs {
            let e = emo.randomElement()!
            
            if dicts[e.key] != nil {
                dicts[e.key] = e.value
            }
        }

        return dicts
    }
    
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
