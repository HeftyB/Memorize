//
//  ContentView.swift
//  Memorize
//
//  Created by Andrew Shields on 11/11/21.
//

import SwiftUI


struct ContentView: View {
    
    @State var emojis: [EmojiCard] = []
    
    @State var selection = ""
    
    let emo = Emoji()
    
    
    
    
    var body: some View {
        VStack {
            if selection.isEmpty {Text("Memorize").font(.title)} else { Text(selection).font(.title) }
                
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    
                    
                    
                    ForEach(emojis) { emo in
                        
                        CardView(emoji: emo.emoji, description: emo.description)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
         
            Spacer()
            
            HStack {
                
                Button("Animals", action:{ emojis = emo.getShuffledCard(.easy, theme: .animals) })
                Button("Food", action:{ emojis = emo.getShuffledCard(.easy, theme: .food) })
                Button("Flags", action:{ emojis = emo.getShuffledCard(.easy, theme: .flags) })
                
            
            }
        }.onAppear(perform: {
            emojis = emo.getShuffledCard(.easy, theme: .animals)
        })
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
