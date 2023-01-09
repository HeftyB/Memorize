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
    
    mutating func shuffle() { cards.shuffle() }
    
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
        var isFaceUp = false {
            didSet {
                if isFaceUp {
                    startUsingBonusTime()
                } else {
                    stopUsingBonusTime()
                }
            }
        }
        var isMatched = false {
            didSet {
                stopUsingBonusTime()
            }
        }
        var flipped = false
        var beenSeen = false
        let content: CardContent
        let description: CardContent?
        let id: String
        
        
        // MARK: - Bonus Time
        
        // this could give matching bonus points
        // if the user matches the card
        // before a certain amount of time passes during which the card is face up
        
        // can be zero which means "no bonus available" for this card
        var bonusTimeLimit: TimeInterval = 30
        
        // how long this card has ever been face up
        private var faceUpTime: TimeInterval {
            if let lastFaceUpDate = self.lastFaceUpDate {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return pastFaceUpTime
            }
        }
        // the last time this card was turned face up (and is still face up)
        var lastFaceUpDate: Date?
        // the accumulated time this card has been face up in the past
        // (i.e. not including the current time it's been face up if it is currently so)
        var pastFaceUpTime: TimeInterval = 0
        
        // how much time left before the bonus opportunity runs out
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - faceUpTime)
        }
        // percentage of the bonus time remaining
        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }
        // whether the card was matched during the bonus time period
        var hasEarnedBonus: Bool {
            isMatched && bonusTimeRemaining > 0
        }
        // whether we are currently face up, unmatched and have not yet used up the bonus window
        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        // called when the card transitions to face up state
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime, lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }
        
        // called when the card goes back face down (or gets matched)
        private mutating func stopUsingBonusTime() {
            pastFaceUpTime = faceUpTime
            self.lastFaceUpDate = nil
        }
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
