//
//  MemoryGame.swift
//  Memorize
//
//  Created by Alexandra Harley on 2/22/23.
//

import Foundation

// 2: When someone uses this struct, they'll have to tell us what cardcontent is at that time. Generic until used
// Equatable allows us to compare CardContent don't care using == since now it has to behave as an Equatable. Fixes the error of using == operator on line 23 where we are comparing card content
struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        // you can separate if statement with , to allow chosenIndex to be defined
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }), !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
//                cards.indices == 0..<cards.count
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        
        print("\(cards)")
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
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        // 1: use a generic because we don't know what kind of data we'll get for the card content (string, image, jpeg, etc.)
        var content: CardContent
        var id: Int // made it an Int!
        
        
        
    }
}
