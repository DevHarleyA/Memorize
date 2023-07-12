//
//  MemoryGame.swift
//  Memorize Model
//
//  Created by Alexandra Harley on 5/21/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card> // "set" allows read, but not write
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly } // make computed to prevent this getting out of sync with cards
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    var score = 0
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = [] // swift knows thi s is an array of cards
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
            cards.shuffle()
        }
    }
    
    mutating func choose(_ card: Card) {
        // cards begin face down
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),  // first index returns anoptional, only proceed if we have an index
           !cards[chosenIndex].isFaceUp, // only proceed if the card is face down
           !cards[chosenIndex].isMatched // only proceed if the card is not matched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard { // take the second card we chose
                if cards[chosenIndex].content == cards[potentialMatchIndex].content { // do the two cards match?
                    cards[chosenIndex].isMatched = true // set them as matched
                    cards[potentialMatchIndex].isMatched = true
                    score += 2 // increment the score as 2
                } else if cards[chosenIndex].wasSeen || cards[potentialMatchIndex].wasSeen {
                    score -= 1
                } else {
                    cards[chosenIndex].wasSeen = true // set both cards as seen if no match
                    cards[potentialMatchIndex].wasSeen = true
                }
                cards[chosenIndex].isFaceUp = true// if both cards match, set back to nil
            } else { // if no match
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex // the first card just chosen gets assigned if we don't have a potential match chosen yet, this makes sure you can't toggle the same card again on line 30 and forces the user to chose a different card
            }
            cards[chosenIndex].isFaceUp.toggle()
            print(score)
        }
    }
    
    // structs within struct --> Mostly something to do with the naming
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var wasSeen = false
        let content: CardContent
        let id: Int
    }
}

struct Theme {
    var name: String
    var emoji: [String]
    var numberOfPairs: Int
    var color: String
    
    let colorOptions = ["red", "orange", "yellow", "green", "mint", "teal", "cyan", "blue", "indigo", "purple", "pink", "brown"]
    let themeOptions = ["Animals", "Country Flags", "Nature", "Sports", "Expressions", "Nom Nom"]
    let emojiDictionary = [
        "Animals": ["🐶","🐱","🐭", "🐹", "🐰","🦊","🐻", "🐼", "🐻‍❄️","🐨","🐯", "🦁", "🐮","🐷","🐸", "🐵"],
        "Country Flags": ["🇯🇲", "🇫🇷", "🇺🇸", "🇰🇷", "🇬🇧", "🏳️‍🌈", "🇧🇸", "🇨🇦", "🇧🇷", "🇧🇪", "🇨🇮", "🇪🇨", "🇨🇺", "🇮🇹", "🇮🇷", "🇯🇵", "🇰🇪", "🇳🇴", "🇿🇦", "🇸🇪", "🇹🇹", "🇺🇦", "🇰🇳", "🇪🇸"],
        "Nature": ["🌵","🌲","🌴", "☘️", "🎋","🌺","🌸", "🌼", "🌪️","🌦️","🌞", "❄️"],
        "Sports": ["🏂","🏋🏾‍♀️","🤸🏾‍♀️", "🤺","⛹🏾‍♂️","🏌🏾‍♀️","🧘🏾‍♀️", "🤾🏾‍♀️","🏇🏾","🤽🏾‍♀️","🏄🏾‍♀️", "🚣🏾‍♀️","🧗🏾‍♀️","🚴🏾‍♀️","🚵🏾‍♀️", "🥇","🏀","🏈","⚾️", "🎾"],
        "Expressions": ["🥲","😊","😘","😜","🥳","😤","😭","😢","😱","🥶","🤯","😶‍🌫️","🤫","🫠","🥺","🤓","🫥","😵‍💫","🙄","😈"],
        "Nom Nom": ["🍎","🫛","🫐","🥔","🥐","🥚","🍔","🥗","🍕","🥨","🌭","🌮","🍤","🎂","🍩","🍫","🍣"]
    ]
    
    init(name: String) {
        if themeOptions.contains(name) {
            self.name = name
            self.emoji = emojiDictionary[name]!
        } else { // if theme doesn't exist, randomize the theme
            let randomTheme = Array(emojiDictionary.keys).randomElement()!
            self.name = randomTheme
            self.emoji = emojiDictionary[randomTheme]!
        }
        
        self.emoji = emoji.shuffled()
        // TODO: [OPTIONAL] Use tertiary operator to either assign a random amount or set amount
        self.numberOfPairs = Int.random(in: 2..<emoji.count)
        // if cards are brown, one may be spelled incorrectly
        self.color = colorOptions.randomElement() ?? "brown"
    }
    
    // TODO: refactor into safe unwrap with default assignment if not (want to avoid more force unwrap)
    mutating func chooseTheme(to theme: String) {
        if theme == "random" {
            name = Array(emojiDictionary.keys).randomElement()!
            emoji = emojiDictionary[name]!
        } else {
            name = theme
            emoji = emojiDictionary[theme]!
        }
        
    }
    
}

extension Array {
    var oneAndOnly: Element? { // Arrays call thier don't cares 'Element'
        if count == 1 {
            return first // same as [0]
        } else {
            return nil
        }
    }
}
