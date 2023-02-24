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
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("\(cards)")
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    // Nest to make clear that this is a card that goes into a memory game
    // Identifiable: A single var that is used to identify this struct against all other card structs
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        // 1: use a generic because we don't know what kind of data we'll get for the card content (string, image, jpeg, etc.)
        var content: CardContent
        var id: Int // made it an Int!
        
        
        
    }
}
