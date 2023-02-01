//
//  Theme.swift
//  Memorize
//
//  Created by Andrew Shields on 8/15/22.
//

import SwiftUI

class ThemeStore: ObservableObject {
    
    let name: String
    
    @Published var themes = [Theme]() {
        didSet {
            saveToUserDefaults()
        }
    }
    
    private var userDefaultsKey: String {
        "ThemeStore: " + name
    }
    
    init(name: String) {
        self.name = name
        loadFromUserDefaults()
        if themes.isEmpty {
            let _ = insertTheme(name: DefaultThemes.vehicls.name, content: DefaultThemes.vehicls.content, cardCount: DefaultThemes.vehicls.cardCount, color: DefaultThemes.vehicls.color)
            let _ = insertTheme(name: DefaultThemes.fruits.name, content: DefaultThemes.fruits.content, cardCount: DefaultThemes.fruits.cardCount, color: DefaultThemes.fruits.color)
            let _ = insertTheme(name: DefaultThemes.animals.name, content: DefaultThemes.animals.content, cardCount: DefaultThemes.animals.cardCount, color: DefaultThemes.animals.color)
            let _ = insertTheme(name: DefaultThemes.faces.name, content: DefaultThemes.faces.content, cardCount: DefaultThemes.faces.cardCount, color: DefaultThemes.faces.color)
        }
    }
    
    private func loadFromUserDefaults() {
        if let themeData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decodedThemes = try? JSONDecoder().decode(Array<Theme>.self, from: themeData) {
            themes = decodedThemes
        }
    }
    
    private func saveToUserDefaults() {
        UserDefaults.standard.set(try? JSONEncoder().encode(themes), forKey: userDefaultsKey)
    }
    
    func insertTheme(name: String, content: String, cardCount: Int, color: RGBAColor) -> Int {
        let newId = (themes.max(by: {$0.id < $1.id})?.id ?? 0) + 1
        themes.append(Theme(id: newId, name: name, content: content, cardCount: cardCount, color: color))
        return newId
    }
    
    func removeTheme(id: Int) {
        themes.removeAll(where: {$0.id == id})
    }
    
    func theme(id: Int) -> Theme {
        if let theme = themes.first(where: {$0.id == id}){
            return theme
        } else {
            return themes.first ?? DefaultThemes.vehicls
        }
    }
    
    struct DefaultThemes {
        static let vehicls = Theme(id: 0, name: "Vehicles", content: "🚙🚗🚘🚕🚖🏎🚚🛻🚛🚐🚓🚔🚑🚒🚀✈️🛫🛬🛩🚁🛸🚲🏍🛶⛵️🚤🛥🛳⛴🚢🚂🚝🚅🚆🚊🚉🚇🛺🚜", cardCount: 8, color: RGBAColor(red: 0, green: 0, blue: 1, alpha: 1))
        static let fruits = Theme(id: 1, name: "Fruits", content: "🍎🍐🍊🍋🍌🍉🍇🍓🫐🍈🍒🍑🥭🍍🥥🥝", cardCount: 4, color: RGBAColor(red: 1, green: 1, blue: 0, alpha: 1))
        static let animals = Theme(id: 2, name: "Animals", content: "🐥🐣🐂🐄🐎🐖🐏🐑🦙🐐🐓🐁🐀🐒🦆🦅🦉🦇🐢🐍🦎🦖🦕🐅🐆🦓🦍🦧🦣🐘🦛🦏🐪🐫🦒🦘🦬🐃🦙🐐🦌🐕🐩🦮🐈🦤🦢🦩🕊🦝🦨🦡🦫🦦🦥🐿🦔", cardCount: 6, color: RGBAColor(red: 153/255, green: 76/255, blue: 0, alpha: 1))
        static let faces = Theme(id: 3, name: "Faces", content: "😀😃😄😁😆😅😂🤣🥲☺️😊😇🙂🙃😉😌😍🥰😘😗😙😚😋😛😝😜🤪🤨🧐🤓😎🥸🤩🥳😏😞😔😟😕🙁☹️😣😖😫😩🥺😢😭😤😠😡🤯😳🥶😥😓🤗🤔🤭🤫🤥😬🙄😯😧🥱😴🤮😷🤧🤒🤠", cardCount: 8, color: RGBAColor(red: 1, green: 0, blue: 0, alpha: 1))
    }
}

extension Collection where Element: Identifiable {
    func index(matching element: Element) -> Self.Index? {
        firstIndex(where: { $0.id == element.id })
    }
}

extension RangeReplaceableCollection where Element: Identifiable {
    mutating func remove(_ element: Element) {
        if let index = index(matching: element) {
            remove(at: index)
        }
    }

    subscript(_ element: Element) -> Element {
        get {
            if let index = index(matching: element) {
                return self[index]
            } else {
                return element
            }
        }
        set {
            if let index = index(matching: element) {
                replaceSubrange(index...index, with: [newValue])
            }
        }
    }
}
