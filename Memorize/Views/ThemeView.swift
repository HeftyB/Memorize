//
//  ThemeView.swift
//  Memorize
//
//  Created by Andrew Shields on 1/13/23.
//

import SwiftUI

struct ThemeView: View {
    
    @Binding var theme: Theme
    @State private var emojisToAdd = ""
    @State private var colorChange: Color = .blue
    
    private let cardCountStepInterval = 2
    private let fixedEmojiSize: CGFloat = 35
    
    private var stepperRange: ClosedRange<Int> {
        if theme.content.count >=  2 {
            return 2...theme.content.count
        } else {
            return 0...2
        }
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            Form {
                name
                emojis
                newEmojis
                cardCount
                color
            }
            .navigationTitle("Edit \(theme.name)")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear{
            colorChange = theme.cardColor
        }
    }
    
    // MARK: - view components
    
    var name: some View {
        Section(header: Text("Name")) {
            TextField("Name", text: $theme.name)
        }
    }
    
    var emojis: some View {
        Section(header: HStack {
            Text("Emojis")
            Spacer()
            Text("Tap & hold to delete")
                .font(.caption2)
                .fontWeight(.light)
            
        }) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: fixedEmojiSize))]) {
                ForEach(theme.content.map {String($0)}, id: \.self) { char in
                    Text(char)
                        .onLongPressGesture {
                            theme.content.removeAll(where: { String($0) == char })
                        }
                }
            }
            .font(.system(size: fixedEmojiSize))
        }
    }
    
    var newEmojis: some View {
        Section(header: Text("Add Emoji")) {
            TextField("Add Emoji", text: $emojisToAdd)
                .onChange(of: emojisToAdd) { emojis in
                    addEmojis(emojis)
                }
        }
    }
    
    var cardCount: some View {
        Section(header: Text("Card Count")) {
            Text("Card Count")
            Stepper(value: $theme.cardCount, in: stepperRange, step: cardCountStepInterval) {
                Text("\(theme.cardCount / 2) pairs")
            }
        }
    }
    
    var color: some View {
        Section(header: Text("Color")) {
            ColorPicker("Card Color", selection: $colorChange)
                .onChange(of: colorChange){ color in
                    theme.color = RGBAColor(color: color)
                }
        }
    }
    
    // MARK: - view functions
    
    func addEmojis(_ emojis: String) {
        withAnimation {
            theme.content = (theme.content + emojis)
                .filter({$0.isEmoji})
                .removingDuplicateCharacters
        }
    }

}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .constant(ThemeStore.DefaultThemes.vehicls))
    }
}

extension String {
    var removingDuplicateCharacters: String {
        reduce(into: "") { sofar, element in
            if !sofar.contains(element) {
                sofar.append(element)
            }
        }
    }
}

extension Character {
    var isEmoji: Bool {
        if let firstScalar = unicodeScalars.first, firstScalar.properties.isEmoji {
            return (firstScalar.value >= 0x238d || unicodeScalars.count > 1)
        } else {
            return false
        }
    }
}

extension Theme {
    var cardColor: Color {
        Color(rgbaColor: self.color)
    }
}
