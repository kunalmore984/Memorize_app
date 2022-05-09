//
//  MemorizeApp.swift
//  Memorize
//
//  Created by kunal more on 03/12/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        let game = EmojiMemoryGame()
        //let theme = ThemeOfTheGame()
        WindowGroup {
            ContentView(viewmodel: game)
        }
    }
}
