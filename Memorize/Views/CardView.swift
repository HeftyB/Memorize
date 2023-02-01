//
//  CardView.swift
//  Memorize
//
//  Created by Andrew Shields on 11/11/21.
//

import SwiftUI

struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    /// Time remaining for bonus points in seconds.
    @State private var animatedBonusRemaining: Double = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                pie
                VStack {
                    Text(card.content)
                        .font(Font.system(size: DrawingConstants.fontSize))
                        .scaleEffect(scale(thatFits: geometry.size))
                    Text(card.description ?? "")
                        .font(.caption)
                        .scaleEffect(scale(thatFits: geometry.size))
                }
                .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                .animation(Animation.easeInOut)
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    /// Filled circle representing remaining bonus time
    var pie: some View {
        Group {
            if card.isConsumingBonusTime {
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1-animatedBonusRemaining)*360-90))
                    .onAppear {
                        animatedBonusRemaining = card.bonusRemaining
                        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                            animatedBonusRemaining = 0
                        }
                    }
            } else {
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1-card.bonusTimeLimit)*360-90))
            }
        }
        .padding(5)
        .opacity(0.5)
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / DrawingConstants.fontSize / DrawingConstants.fontScale
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 1.2
        static let fontSize: CGFloat = 64
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: MemoryGame<String>.Card(content: "🍌", description: "Banana", id: "Banana"))
    }
}
