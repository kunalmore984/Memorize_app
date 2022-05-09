//
//  Themes.swift
//  Memorize
//
//  Created by kunal more on 24/02/22.
//  This is themes Model file

import Foundation
import SwiftUI

struct Themes{
    static var name: String = "Vehicles"
    static var color: Color = .red
    static var n : Int = 4
    static var Theme_emojis: Array<String> = [""]
    //private (set) var themeCards: Array<Card>
    
    /**init(NumberOfPairOfCards: Int, CreateCardContent:(Int)->CardContent){
        themeCards = Array<Card>()
        for pairIndex in 0..<NumberOfPairOfCards {
            let content : CardContent = CreateCardContent(pairIndex)
            themeCards.append(Card(id: pairIndex*2, content: content))
            themeCards.append(Card(id: pairIndex*2+1, content: content))
        }
        themeCards.shuffle()
    }**/
    
    init(){
        Themes.name = "Vehicles"
        Themes.color = .red
        Themes.Theme_emojis = ["🚂","🛳","🚙","✈️","🚀","🚜","🛺","🚗","🏎","🚌","🛻",
                               "🚐","🚎","🚓","🚑","🚒","🚝","🚈","🛩","🛸","🚁","🚤"]
    }
    
    mutating func setTheme(themeName: String){
        Themes.name = themeName
        switch(Themes.name){
        case "animals":
            Themes.color = .blue
            Themes.Theme_emojis = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯",
                      "🦁","🐮","🐷","🐵","🐆","🦓","🦍","🦧","🦣","🐅","🦒"]
            Themes.n = 6
            print("Changed Animals,\n \(Themes.Theme_emojis)")
            break
        case "Fruits":
            Themes.color = .green
            Themes.Theme_emojis = ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈",
                      "🍒","🍑","🥭","🍍","🥥","🥝","🍅","🍆","🥑"]
            Themes.n = 7
            print("Changed Fruits,\n \(Themes.Theme_emojis)")

            break
        case "Vehicle":
            Themes.color = .red
            Themes.Theme_emojis = ["🚂","🛳","🚙","✈️","🚀","🚜","🛺","🚗","🏎","🚌","🛻",
                      "🚐","🚎","🚓","🚑","🚒","🚝","🚈","🛩","🛸","🚁","🚤"]
            Themes.n = 4
            print("Changed Vehicles,\n \(Themes.Theme_emojis)")

            break
        default:
            print("No theme present,\n \(Themes.Theme_emojis)")
        }
    }
    /**struct Card{
        var id: Int
        var isFaceup: Bool = false;
        var isMatched: Bool = false;
        var content : CardContent
    }**/
}
