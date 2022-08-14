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
       
    init(createCardContent: () -> [CardContent:CardContent]) {
        cards = Array<Card>()
        totalPoints = 0
        currSelect = nil
        isMatch = false
        
        let content = createCardContent()
        
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
}
