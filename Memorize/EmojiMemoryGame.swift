//
//  EmojiMemoryGame.swift
//  Memorize View Model
//
//  Created by Alexandra Harley on 5/21/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🇯🇲", "🇫🇷", "🇺🇸", "🇰🇷", "🇬🇧", "🏳️‍🌈", "🇧🇸", "🇨🇦", "🇧🇷", "🇧🇪", "🇨🇮", "🇪🇨", "🇨🇺", "🇮🇹", "🇮🇷", "🇯🇵", "🇰🇪", "🇳🇴", "🇿🇦", "🇸🇪", "🇹🇹", "🇺🇦", "🇰🇳", "🇪🇸"] // static makes it global, but it's nested. Allows it to be initialized
    var animalEmojis = ["🐶","🐱","🐭", "🐹", "🐰","🦊","🐻", "🐼", "🐻‍❄️","🐨","🐯", "🦁", "🐮","🐷","🐸", "🐵"]
    var natureEmojis = ["🌵","🌲","🌴", "☘️", "🎋","🌺","🌸", "🌼", "🌪️","🌦️","🌞", "❄️"]
    var sportsEmojis = ["🏂","🏋🏾‍♀️","🤸🏾‍♀️", "🤺","⛹🏾‍♂️","🏌🏾‍♀️","🧘🏾‍♀️", "🤾🏾‍♀️","🏇🏾","🤽🏾‍♀️","🏄🏾‍♀️", "🚣🏾‍♀️","🧗🏾‍♀️","🚴🏾‍♀️","🚵🏾‍♀️", "🥇","🏀","🏈","⚾️", "🎾"]
    var flagEmojis = ["🇯🇲", "🇫🇷", "🇺🇸", "🇰🇷", "🇬🇧", "🏳️‍🌈", "🇧🇸", "🇨🇦", "🇧🇷", "🇧🇪", "🇨🇮", "🇪🇨", "🇨🇺", "🇮🇹", "🇮🇷", "🇯🇵", "🇰🇪", "🇳🇴", "🇿🇦", "🇸🇪", "🇹🇹", "🇺🇦", "🇰🇳", "🇪🇸"]
    
    @State var emojiCount = Int.random(in: 4..<24)
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
                emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
     // "private" protects the model from view, var since choose function is mutating
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
