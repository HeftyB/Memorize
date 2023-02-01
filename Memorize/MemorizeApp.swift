//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Andrew Shields on 11/11/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject private var themeStore = ThemeStore(name: "Default")
    
    var body: some Scene {
        WindowGroup {
            ThemeSelector(store: themeStore)
        }
    }
}
