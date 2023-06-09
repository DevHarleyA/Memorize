//
//  EmojiMemoryGame.swift
//  Memorize View Model
//
//  Created by Alexandra Harley on 5/21/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    @Published private var currentTheme: Theme
    @Published private var model: MemoryGame<String>
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var cardColor: UIColor {
        let color = currentTheme.color
        switch color {
        case "red":
            return UIColor.systemRed
        case "orange":
            return UIColor.systemOrange
        case "yellow":
            return UIColor.systemYellow
        case "green":
            return UIColor.systemGreen
        case "mint":
            return UIColor.systemMint
        case "teal":
            return UIColor.systemCyan
        case "blue":
            return UIColor.systemBlue
        case "indigo":
            return UIColor.systemIndigo
        case "purple":
            return UIColor.systemPurple
        case "pink":
            return UIColor.systemPink
        case "brown":
            return UIColor.systemBrown
        default:
            return UIColor.systemGray
        }
    }
    
    init() {
        let theme = Theme(name: "random") // newly declared variable with same name in outer scope = shadow variable
        // self.theme is the class theme
        self.currentTheme = theme
        self.model = MemoryGame(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            theme.emoji[pairIndex]
        }
    }
    
    static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: Int.random(in: 0..<theme.emoji.count)) { pairIndex in
            theme.emoji[pairIndex]
        }
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func chooseTheme(to theme: String) {
        currentTheme.chooseTheme(to: theme)
    }
    
    
    
}
