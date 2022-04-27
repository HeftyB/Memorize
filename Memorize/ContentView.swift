//
//  ContentView.swift
//  Memorize
//
//  Created by Andrew Shields on 11/11/21.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject
    var viewModel: EmojiMemoryGame

    @State var emojis: [EmojiCard] = []
    let emo = Emoji()
    
    var body: some View {
        
        VStack {
                // TITLE +  SELECTION
//            if selection.isEmpty {Text("Memorize").font(.title)} else { Text(selection).font(.title) }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                .foregroundColor(.red)
            }
//            Spacer()
//            HStack {
//                Spacer()
//                    // ANIMAL BUTTON
//                Button(action: { emojis = emo.getShuffledCard(.easy, theme: .animals) }) {
//                    VStack {
//                        Image(systemName: "pawprint")
//                            .frame(width: 25, height: 25)
//
//                        Text("Animals").font(.footnote)
//                    }
//
//                }
//                Spacer()
//                    // FOOD BUTTON
//                Button(action: { emojis = emo.getShuffledCard(.easy, theme: .food) }) {
//                    VStack {
//                        Image(systemName: "fork.knife")
//                            .frame(width: 25, height: 25)
//
//                        Text("Food").font(.footnote)
//                    }
//                }
//                Spacer()
//                    // FLAG BUTTON
//                Button(action: { emojis = emo.getShuffledCard(.easy, theme: .flags) }) {
//                    VStack {
//                        Image(systemName: "flag")
//                            .frame(width: 25, height: 25)
//
//                        Text("Flags").font(.footnote)
//                    }
//                }
//                Spacer()
//            }
//            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
