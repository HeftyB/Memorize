//
//  NewGame.swift
//  Memorize
//
//  Created by Andrew Shields on 5/11/22.
//

import SwiftUI

struct NewGame: View {
    @State var diff: Difficulty
    @State var theme: ThemeName
//    var viewModel: EmojiMemoryGame
    
    var body: some View {
        List {
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Theme").bold()
                Picker("Theme", selection: $theme) {
                    ForEach(ThemeName.allCases) { name in
                        Text(name.rawValue)
                            .tag(name)
                    }
    //
    //                /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
    //                /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
            }
            
            Button(action: {}) {
                Text("GO!")
            }
        }
    }
}

struct NewGame_Previews: PreviewProvider {
    static var previews: some View {
        NewGame(diff: Difficulty.easy, theme: ThemeName.animals)
    }
}
