//
//  ThemeSelector.swift
//  Memorize
//
//  Created by Andrew Shields on 1/10/23.
//

import SwiftUI

struct ThemeSelector: View {
    
    @ObservedObject var store: ThemeStore
    
    @State var themes: [Int:EmojiMemoryGame] = [:]
    @State private var alertToShow: IdentifiableAlert?
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(store.themes.count) themes available!")
                    .font(.subheadline)
                    .fontWeight(.thin)
                themeList
            }
        }
    }
    
    // MARK: - view components
    
    /// Editing
    @State private var editMode: EditMode = .inactive
    @State private var themeToEdit: Theme?
    
    /// Add new theme
    @State var newName = ""
    @State var showAddNewTheme = false
    @State var newTheme = blankTheme
    
    var addThemeButton: some View {
        Button(action: { showAddNewTheme.toggle() }, label: {
            Image(systemName: "plus")
        })
        .popover(isPresented: $showAddNewTheme) {
            Form {
                TextField("Enter a name!", text: $newName)
                    .padding(.vertical)
                Button("Create Theme", action: createTheme)
                    .buttonStyle(.borderedProminent)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity ,alignment: .center)
            }
            .padding(.horizontal)
            .onSubmit(createTheme)
            .presentationDetents([.medium])
        }
        .alert(item: $alertToShow) { alertToShow in
            alertToShow.alert()
        }
    }
    
    var themeList: some View {
        List {
            ForEach(store.themes) { theme in
                if themes.isEmpty { Text("!") }
                else {
                    NavigationLink(destination: EmojiMemoryGameView(game: themes[theme.id]!)) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(theme.name)
                                Spacer()
                                theme.cardColor
                                    .frame(width: 20, height: 20)
                                Text("Total pairs: \(theme.cardCount)")
                                    .font(.caption)
                            }
                            Text(theme.content)
                                .font(.caption2)
                        }
                    }
                    .gesture(editMode == .active ? editTap(theme: theme) : nil)
                }
            }
            .onDelete { indexSet in
                store.themes.remove(atOffsets: indexSet)
            }
            .onMove { indexSet, newOffset in
                store.themes.move(fromOffsets: indexSet, toOffset: newOffset)
            }
        }
        .listStyle(.automatic)
        .onAppear(perform: loadThemesIntoState)
        .onChange(of: store.themes, perform: updateMemoryGameTheme(themes:))
        .popover(item: $themeToEdit) { theme in
            ThemeView(theme: $store.themes[theme])
        }
        .toolbar {
            ToolbarItem { EditButton() }
            ToolbarItem(placement: .navigationBarLeading) {
                addThemeButton
            }
        }
        .environment(\.editMode, $editMode)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Select Theme")
    }
    
    // MARK: - view functions
    
    private func showMinReqForThemeAlert() {
        alertToShow = IdentifiableAlert(id: "new theme creation failed") { Alert (
            title: Text("Create New Theme"),
            message: Text("Please Choose a unique name & at least 2 emojis"),
            dismissButton: .default(Text("OK"))
        )}
    }
    
    private func checkThemeMinimumRequirements(_ name: String) -> Bool {
        if !store.themes.contains(where: {$0.name == name}) {
            return true
        } else {
            return false
        }
    }
    
    private func editTap(theme: Theme) -> some Gesture {
        TapGesture()
            .onEnded {
                themeToEdit = theme
            }
    }
    
    private func createTheme() {
        if checkThemeMinimumRequirements(newName) {
            let themeId = store.insertTheme(name: newName, content: "", cardCount: 0, color: RGBAColor(red: 0, green: 0, blue: 1, alpha: 1))
            newName = ""
            showAddNewTheme = false
            let theme = store.theme(id: themeId)
            themes[themeId] = EmojiMemoryGame(theme: theme)
            themeToEdit = theme
        } else {
            showMinReqForThemeAlert()
        }
    }

    private func loadThemesIntoState() {
        store.themes.forEach({ theme in
            let game = EmojiMemoryGame(theme: theme)
            themes[theme.id] = game
        })
    }
    
    private func updateMemoryGameTheme(themes: [Theme]) {
        themes.forEach({ if $0 != self.themes[$0.id]?.theme {
            self.themes[$0.id] = EmojiMemoryGame(theme: $0)
        } })
    }
    
    private static let blankTheme = Theme(id: 0, name: "", content: "", cardCount: 0, color: RGBAColor(red: 0, green: 0, blue: 1, alpha: 1))
}

struct ThemeSelector_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ThemeSelector(store: ThemeStore(name: "Light"))
            ThemeSelector(store: ThemeStore(name: "Dark"))
                .preferredColorScheme(.dark)
        }
    }
}


struct RGBAColor: Codable, Equatable, Hashable {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
}

struct IdentifiableAlert: Identifiable {
    var id: String
    var alert: () -> Alert
}

extension Color {
    init(rgbaColor rgba: RGBAColor) {
        self.init(.sRGB, red: rgba.red, green: rgba.green, blue: rgba.blue, opacity: rgba.alpha)
    }
}

extension RGBAColor {
    init(color: Color) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        if let cgColor = color.cgColor {
            UIColor(cgColor: cgColor).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        }
        
        self.init(red: Double(red), green: Double(green), blue: Double(blue), alpha: Double(alpha))
    }
}
