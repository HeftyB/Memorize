//
//  ContentView.swift
//  Memorize
//
//  Created by Andrew Shields on 11/11/21.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚗", "🚛", "🚕", "🚜", "🛵", "🚍", "🚠", "🚝","🚆","🚢"]
    @State var count = 4
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<count], id: \.self) { e in
                        CardView(content: e)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
         
            Spacer()
            
            HStack {
                Button(action: { if count > 1 {count -= 1} }) {
                    Image(systemName: "minus.circle")
                }
                
                Spacer()
                
                Button(action: { if count < emojis.count {count += 1} }) {
                    Image(systemName: "plus.circle")
                }
            }
        }
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
