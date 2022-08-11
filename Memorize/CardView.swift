//
//  CardView.swift
//  Memorize
//
//  Created by Andrew Shields on 11/11/21.
//

import SwiftUI

struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                VStack {
                    Text(card.content).font(.largeTitle)
                    Text(card.description ?? " ").font(.caption)
                }
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: MemoryGame<String>.Card(content: "🍌", description: "Banana", id: "Banana"))
    }
}
