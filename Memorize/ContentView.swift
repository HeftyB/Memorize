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
    var diffColor: Color {
        
        switch viewModel.difficulty {
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
        switch viewModel.theme.color {
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
    
    @State
    private var showSettings = false
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Practice matching your \(viewModel.theme.name.rawValue)")
                Text("|")
                Text(viewModel.difficulty.rawValue).foregroundColor(diffColor)
            }
            .font(.caption2)
            ZStack(alignment: .trailing) {
                Rectangle()
                    .frame(height: 48.0)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.yellow/*@END_MENU_TOKEN@*/)
                Text("\(viewModel.totalPoints)")
                    .font(.body)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding()
                    
            }
            .padding()
            
            Text(viewModel.currSelect ?? " ")
            
            if viewModel.isMatch {
                Text("Match!")
                .frame(minWidth: 200)
                .animation(/*@START_MENU_TOKEN@*/.easeInOut/*@END_MENU_TOKEN@*/, value: 75)
                
            }
                
            
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
                .foregroundColor(cardColor)
            }
            
            Divider()

            HStack {
                
                Group {
                    Button(action: viewModel.newGame) {
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
            NewGame(diff: viewModel.difficulty, theme: viewModel.themeName, showSettings: $showSettings, cgame: viewModel.customGame)
        }
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
