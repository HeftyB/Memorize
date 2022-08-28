//
//  MemoryGame.swift
//  Memorize
//
//  Created by Andrew Shields on 4/18/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Hashable {
    private(set) var cards: Array<Card>
    
    private var indexOfFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    var totalPoints: Int
    var currSelect: CardContent?
    var isMatch: Bool
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            isMatch = false
            if let potentialMatchIndex = indexOfFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    
                    totalPoints += 1000
                    if !cards[chosenIndex].beenSeen { totalPoints += 500}
                    if !cards[potentialMatchIndex].beenSeen { totalPoints += 500}
                    isMatch = true
                }
                else { if cards[chosenIndex].beenSeen { totalPoints -= 300} }
                
                cards[chosenIndex].isFaceUp = true
            } else { indexOfFaceUpCard = chosenIndex }
            
            if !cards[chosenIndex].beenSeen { cards[chosenIndex].beenSeen = true }
            currSelect = cards[chosenIndex].description
        }
    }
       
    init(cardContent: [CardContent: CardContent], difficulty diff: Difficulty) {
        cards = []
        totalPoints = 0
        currSelect = nil
        isMatch = false

        let content = randomContent(totalPairs: pairCounter(difficulty: diff), content: cardContent)
        
        for (k,v) in content {
            cards.append(Card(content: k, description: v, id: "\(k)"))
            cards.append(Card(content: k, description: v, id: "\(k)Match"))
        }
        cards.shuffle()
    }
    
    func pairCounter(difficulty: Difficulty) -> Int {
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
        return totalPairs
    }
    
    func randomContent(totalPairs: Int, content: [CardContent: CardContent]) -> [CardContent: CardContent] {
        var dicts = [CardContent:CardContent]()
        
        while dicts.count < totalPairs {
            let e = content.randomElement()!
            if dicts[e.key] == nil {
                dicts[e.key] = e.value
            }
        }
        
        return dicts
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var flipped = false
        var beenSeen = false
        let content: CardContent
        let description: CardContent
        let id: String
    }
}


extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
