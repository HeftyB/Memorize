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
    
    @State
    private var showSettings = false
    
    var body: some View {
        
        VStack {
            
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
                .foregroundColor(.red)
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
