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
    @Binding var showSettings: Bool
    
    var cgame: (Difficulty, ThemeName) -> Void
    
    var body: some View {
        List {
            Text("Game Settings")
                .font(.title)
                .multilineTextAlignment(.leading)
            Spacer()
            VStack(spacing: 20) {
                Text("Theme:")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Picker("Theme", selection: $theme) {
                    ForEach(ThemeName.allCases) { name in
                        Text(name.rawValue)
                            .tag(name)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.vertical, 30.0)
            VStack {
                Text("Difficulty:")
                    .font(.caption)
                    .fontWeight(.bold)
                Picker("Difficulty", selection: $diff) {
                    ForEach(Difficulty.allCases) { diff in
                        Text(diff.rawValue)
                            .tag(diff)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.vertical, 30.0)
            Button(action: {
                cgame(diff, theme)
                showSettings = false
            }) {
                Text("GO!")
            }
            .accessibilityLabel("Submit")
        }
        
    }
}

struct NewGame_Previews: PreviewProvider {
    
    static var previews: some View {
        NewGame(diff: Difficulty.easy, theme: ThemeName.animals, showSettings: .constant(true), cgame: {_ , _ in print("hello")})
    }
}
