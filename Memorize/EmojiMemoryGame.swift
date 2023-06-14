//
//  EmojiMemoryGame.swift
//  Memorize View Model
//
//  Created by Alexandra Harley on 5/21/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    typealias Card = MemoryGame<String>.Card // code clean up
    @Published private var currentTheme: Theme
    @Published private var model: MemoryGame<String>
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // Use system colors for light/dark mode adaptation
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
    
    var themeName: String {
        currentTheme.name
    }
    
    var themeNumberOfCards: Int {
        currentTheme.emoji.count
    }
    
    var score: Int {
        model.score
    }
    
    init() {
        let theme = Theme(name: "random") // newly declared variable with same name in outer scope = shadow variable
        // self.theme is the class theme
        self.currentTheme = theme
        self.model = MemoryGame(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            theme.emoji[pairIndex]
        }
    }
    
    func createMemoryGame(with name: String) {
        currentTheme = Theme(name: name)
        model = MemoryGame(numberOfPairsOfCards: currentTheme.numberOfPairs) { pairIndex in
            currentTheme.emoji[pairIndex]
        }
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func chooseTheme(to theme: String) {
        currentTheme.chooseTheme(to: theme)
    }
    
    
    
}
