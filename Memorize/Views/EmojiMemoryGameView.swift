//
//  ContentView.swift
//  Memorize
//
//  Created by Andrew Shields on 11/11/21.
//

import SwiftUI


struct EmojiMemoryGameView: View {
    
    @ObservedObject
    var game: EmojiMemoryGame
    
    @Namespace
    private var dealingNameSpace
    
    @State
    private var showSettings = false
    
    @State
    private var dealt = Set<String>()
    
    var diffColor: Color {
        switch game.difficulty {
        case .easy:
            return .blue
        case .medium:
            return .green
        case .hard:
            return .orange
        case .expert:
            return .red
        }
    }
    
    var cardColor: Color {
        switch game.cardColor {
        case .yellow:
            return .yellow
        case .blue:
            return .blue
        case .green:
            return .green
        case .purple:
            return .purple
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Practice matching your \(game.themeName.rawValue)")
                Text("|")
                Text(game.difficulty.rawValue).foregroundColor(diffColor)
            }
            .font(.caption2)
            ZStack(alignment: .trailing) {
                Rectangle()
                    .frame(height: 48.0)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.yellow/*@END_MENU_TOKEN@*/)
                Text("\(game.totalPoints)")
                    .font(.body)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding()
                    
            }
            .padding()
            
            Text(game.currSelect ?? " ")
            
            if game.isMatch {
                Text("Match!")
                .frame(minWidth: 200)
                .animation(/*@START_MENU_TOKEN@*/.easeInOut/*@END_MENU_TOKEN@*/, value: 75)
                
            }
                
            ZStack(alignment: .bottom) {
                VStack {
                    gameBody
                    HStack {
                        restart
                        Spacer()
                        shuffle
                    }
                    .padding(.horizontal)
                    
                }
                deckBody
            }
            .padding()
            
            Divider()
            HStack {
                Group {
                    Button(action: game.newGame) {
                        Text("New Game")
                    }
                    Button(action: { showSettings.toggle() }) {
                        Text("Settings")
                    }
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    }
                }
                .padding(.all, 10.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .font(.footnote)
            }
            .padding()
        }
        .padding(.horizontal)
        .sheet(isPresented: $showSettings) {
            NewGame(diff: game.difficulty, theme: game.themeName, showSettings: $showSettings, cgame: game.customGame)
        }
    }
    
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
        .foregroundColor(cardColor)
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
        .foregroundColor(CardConstants.color)
        .onTapGesture {
            for card in game.cards {
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
                }
            }
        }
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
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
//        EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.dark)
        return EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}
