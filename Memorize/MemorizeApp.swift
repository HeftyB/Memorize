//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Andrew Shields on 11/11/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
