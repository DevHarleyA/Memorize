//
//  MemoryGame.swift
//  Memorize Model
//
//  Created by Alexandra Harley on 5/21/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card> // "set" allows read, but not write
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
            cards.shuffle()
        }
    }
    
    mutating func choose(_ card: Card) {
        // use comma to separate if let to set order, && won't work here
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in 0..<cards.count {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        
        print("\(cards)")
    }
    
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    // structs within struct --> Mostly something to do with the naming
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}

struct Theme {
    var name: String
    var emoji: [String]
    var numberOfPairs: Int
    var color: String
    
    let colorOptions = ["red", "orange", "yellow", "green", "mint", "teal", "cyan", "blue", "indigo", "purple", "pink", "brown"]
    let themeOptions = ["animal", "flag", "nature", "sports", "emojis", "food"]
    let emojiDictionary = [
        "animal": ["🐶","🐱","🐭", "🐹", "🐰","🦊","🐻", "🐼", "🐻‍❄️","🐨","🐯", "🦁", "🐮","🐷","🐸", "🐵"],
        "flag": ["🇯🇲", "🇫🇷", "🇺🇸", "🇰🇷", "🇬🇧", "🏳️‍🌈", "🇧🇸", "🇨🇦", "🇧🇷", "🇧🇪", "🇨🇮", "🇪🇨", "🇨🇺", "🇮🇹", "🇮🇷", "🇯🇵", "🇰🇪", "🇳🇴", "🇿🇦", "🇸🇪", "🇹🇹", "🇺🇦", "🇰🇳", "🇪🇸"],
        "nature": ["🌵","🌲","🌴", "☘️", "🎋","🌺","🌸", "🌼", "🌪️","🌦️","🌞", "❄️"],
        "sports": ["🏂","🏋🏾‍♀️","🤸🏾‍♀️", "🤺","⛹🏾‍♂️","🏌🏾‍♀️","🧘🏾‍♀️", "🤾🏾‍♀️","🏇🏾","🤽🏾‍♀️","🏄🏾‍♀️", "🚣🏾‍♀️","🧗🏾‍♀️","🚴🏾‍♀️","🚵🏾‍♀️", "🥇","🏀","🏈","⚾️", "🎾"],
        "emojis": ["🥲","😊","😘","😜","🥳","😤","😭","😢","😱","🥶","🤯","😶‍🌫️","🤫","🫠","🥺","🤓","🫥","😵‍💫","🙄","😈"],
        "food": ["🍎","🫛","🫐","🥔","🥐","🥚","🍔","🥗","🍕","🥨","🌭","🌮","🍤","🎂","🍩","🍫","🍣"]
    ]
    
    init(name: String) {
        if name == "random" {
            let randomTheme = Array(emojiDictionary.keys).randomElement()!
            self.name = randomTheme
            self.emoji = emojiDictionary[randomTheme]!
        } else {
            self.name = name
            self.emoji = emojiDictionary[name]!
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
