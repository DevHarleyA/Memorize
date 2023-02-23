//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alexandra Harley on 2/22/23.
//

// not a view, but still part of the UI so we want to import SwiftUI
import SwiftUI

// viewmodel is a class (object-oriented)
// protects the model, only view model has access to model
class EmojiMemoryGame {
    
    // static makes it like a global variable.
    static let emojis = ["✈️", "🚗", "🚂", "🚀", "🚌", "🚙", "🚕", "🏎", "🚜", "🚐", "🛻", "🚒", "🚚", "🚛", "🏍", "🛸", "🚁", "🚆", "🚎", "🚓", "🛵", "🛳", "🚘", "🚖 "]
    
    // functions can be static too (like a global function) Helps us create the memory game without having an initialization
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }

    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
