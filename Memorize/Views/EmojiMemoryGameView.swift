//
//  ContentView.swift
//  Memorize
//
//  Created by Andrew Shields on 11/11/21.
//

import SwiftUI


struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame

    @Namespace private var dealingNameSpace
    
    /// Keeps track of cards that have been "dealt" in the UI
    @State private var dealt = Set<String>()
    
    /// Dynamic var to simulate difficulty selection
    private var difficulty: Difficulty {
        let count = game.theme.cardCount
        if count > 12 { return .hard }
        else if count > 8 { return .medium }
        else { return .easy }
    }
    
    /// Color for Text displaying difficulty
    private var diffColor: Color {
        switch difficulty {
        case .easy:
            return .blue
        case .medium:
            return .green
        case .hard:
            return .orange
        }
    }
    
    ///  Conversion from saved RGB values to Color valuez
    var cardBackColor: Color {
        Color(rgbaColor: game.theme.color)
    }
    
    var body: some View {
        VStack {
            infoBar
            score
            Text(game.currSelect ?? " ")
            
            if game.isMatch {
                Text("Match!")
                .frame(minWidth: 200)
                .animation(/*@START_MENU_TOKEN@*/.easeInOut/*@END_MENU_TOKEN@*/, value: 75)
            }
                
            ZStack(alignment: .bottom) {
                VStack {
                    gameBody
                    buttons
                }
                deckBody
            }
            .padding()
        }
        .padding(.horizontal)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("Color 3")/*@END_MENU_TOKEN@*/)
    }
    
    
    
    // MARK: - view components
    
    var gameBody: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
            if isUndealt(card) || card.isMatched && !card.isFaceUp {
                Color.clear
            } else {
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNameSpace)
                    .padding(4)
                    .transition(AnyTransition.asymmetric(insertion: .identity, removal: .scale))
                    .zIndex(zIndex(of: card))
                    .onTapGesture {
                        withAnimation(.easeInOut) { game.choose(card) }
                    }
            }
            
        })
        .foregroundColor(cardBackColor)
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(game.cards.filter(isUndealt)) { card in
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNameSpace)
                    .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
                    .zIndex(zIndex(of: card))
            }
        }
        .frame(width: CardConstants.undealtWidth, height: CardConstants.undealtHeight)
        .foregroundColor(cardBackColor)
        .onTapGesture {
            for card in game.cards {
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
                }
            }
        }
    }
    
    var infoBar: some View {
        HStack {
            Group {
                Text("Practice matching your \(game.theme.name)")
                Text("|")
            }
            .foregroundColor(.black)
            Text(difficulty.rawValue).foregroundColor(diffColor)
        }
        .font(.caption2)
    }
    
    var score: some View {
        ZStack(alignment: .trailing) {
            Rectangle()
                .frame(height: 48.0)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color("Color 4")/*@END_MENU_TOKEN@*/)
            Text("\(game.totalPoints)")
                .font(.body)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding()
                
        }
        .padding()
    }
    
    var buttons: some View {
        HStack {
            restart
            Spacer()
            shuffle
        }
        .padding(.horizontal)
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                game.shuffle()
            }
        }
    }
    
    var restart: some View {
        Button("Restart") {
            withAnimation {
                dealt = []
                game.restart()
            }
        }
    }
    
    // MARK: - view functions
    
    private func deal(_ card: EmojiMemoryGame.Card) {
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: EmojiMemoryGame.Card) -> Bool {
        !dealt.contains(card.id)
    }
    
    private func dealAnimation(for card: EmojiMemoryGame.Card) -> Animation {
        var delay = 0.0
        
        if let index = game.cards.firstIndex(where: { $0.id == card.id }) {
            delay = Double(index) * (CardConstants.totalDealDuration / Double(game.cards.count))
        }
        return Animation.easeInOut(duration: CardConstants.dealDuration).delay(delay)
    }
    
    private func zIndex(of card: EmojiMemoryGame.Card) -> Double {
        -Double(game.cards.firstIndex(where: { $0.id == card.id }) ?? 0)
    }
    
    
    
    
    private enum Difficulty: String, CaseIterable {
        case easy, medium, hard
    }
    
    private struct CardConstants {
        static let color = Color.red
        static let aspectRatio: CGFloat = 2/3
        static let dealDuration: Double = 0.5
        static let totalDealDuration: Double = 2
        static let undealtHeight: CGFloat = 90
        static let undealtWidth = undealtHeight * aspectRatio
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame(theme: ThemeStore.DefaultThemes.animals)
        game.choose(game.cards.first!)

        return Group {
            EmojiMemoryGameView(game: game)
                .preferredColorScheme(.light)
            EmojiMemoryGameView(game: game)
                .preferredColorScheme(.dark)
        }
    }
}
