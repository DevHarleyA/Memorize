//
//  MemoryGame.swift
//  Memorize Model
//
//  Created by Alexandra Harley on 5/21/23.
//

import Foundation

struct MemoryGame<CardContent> { // when someone uses this, they have to tell us what the type parameter is (String)
    var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    // structs within struct --> Mostly something to do with the naming
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
