//
//  EmojiMemoryGame.swift
//  Memorize View Model
//
//  Created by Alexandra Harley on 5/21/23.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["🇯🇲", "🇫🇷", "🇺🇸", "🇰🇷", "🇬🇧", "🏳️‍🌈", "🇧🇸", "🇨🇦", "🇧🇷", "🇧🇪", "🇨🇮", "🇪🇨", "🇨🇺", "🇮🇹", "🇮🇷", "🇯🇵", "🇰🇪", "🇳🇴", "🇿🇦", "🇸🇪", "🇹🇹", "🇺🇦", "🇰🇳", "🇪🇸"] // static makes it global, but it's nested. Allows it to be initialized
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
                emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
     // "private" protects the model from view
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
