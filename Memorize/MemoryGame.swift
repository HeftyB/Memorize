//
//  MemoryGame.swift
//  Memorize
//
//  Created by Andrew Shields on 4/18/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    private var indexOfFaceUpCard: Int?
    
    /// to check timing of move for points (future realease)
//    var moveStamp: Date
    var totalPoints: Int
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            
            if let potentialMatchIndex = indexOfFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfFaceUpCard = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
       
    init(nummberOfPairsOfCards: Int, createCardContent: (Int) -> [CardContent]) {
        cards = Array<Card>()
        totalPoints = 0
        
        let content = createCardContent(nummberOfPairsOfCards)
        
        for thing in content {
            cards.append(Card(content: thing, id:cards.count+1))
            cards.append(Card(content: thing, id:cards.count+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var flipped: Bool = false
        var content: CardContent
        var description: String?
        var id: Int
    }
}
