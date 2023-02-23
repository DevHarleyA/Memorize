//
//  MemoryGame.swift
//  Memorize
//
//  Created by Alexandra Harley on 2/22/23.
//

import Foundation

// 2: When someone uses this struct, they'll have to tell us what cardcontent is at that time. Generic until used
struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    func choose(_: Card) {
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(isFaceUp: false, isMatched: false, content: <#T##CardContent#>))
        }
    }
    
    // Nest to make clear that this is a card that goes into a memory game
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        // 1: use a generic because we don't know what kind of data we'll get for the card content (string, image, jpeg, etc.)
        var content: CardContent
        
        
        
    }
}
