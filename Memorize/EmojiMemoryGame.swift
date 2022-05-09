//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by kunal more on 17/02/22.
//  ViewModel of the app

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    @Published private var themeModel: Themes = Themes()
    @Published private var model: MemoryGame<String> = CreateMemorygame()
    var cards: Array<MemoryGame<String>.Cards>{
        return model.cards
    }
    static func CreateMemorygame() -> MemoryGame<String>{
        let testArr : Array<String> = Themes.Theme_emojis
        return MemoryGame<String>(NumberOfPairOfCards: Themes.n){
            pairIndex in testArr[pairIndex]
        }
    }
    
    var score_card: Int{
        return model.score
    }
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Cards){
        model.choose(card)
    }
    
    func chooseTheme(_ theme: String){
        themeModel.setTheme(themeName: theme)
        model = EmojiMemoryGame.CreateMemorygame()
    }
}
