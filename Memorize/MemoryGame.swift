//
//  MemoryGame.swift
//  Memorize Model
//
//  Created by Alexandra Harley on 5/21/23.
//

import Foundation

struct MemoryGame<CardContent> { // when someone uses this, they have to tell us what the type parameter is (String)
    private(set) var cards: Array<Card> // "set" allows read, but not write
    
    func choose(_ card: Card) {
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    // structs within struct --> Mostly something to do with the naming
    struct Card {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}
