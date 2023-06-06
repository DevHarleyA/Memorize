//
//  EmojiMemoryGame.swift
//  Memorize View Model
//
//  Created by Alexandra Harley on 5/21/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    @Published private var theme: Theme
    @Published private var model: MemoryGame<String>
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    init() {
        self.theme = Theme()
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
    
}
