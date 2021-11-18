//
//  CardView.swift
//  Memorize
//
//  Created by Andrew Shields on 11/11/21.
//

import SwiftUI

struct CardView: View {
    var emoji: String
    var description: String
    
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(emoji).font(.largeTitle)
                Text(description).font(.caption)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(emoji: "🤙", description: "Broseph")
    }
}
