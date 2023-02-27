//
//  ContentView.swift
//  Memorize
//
//  Created by Harley, Alexandra on 1/30/23.
//

import SwiftUI

struct ContentView: View {
    // Property Wrapper requires that this has to be a var
    @ObservedObject var viewModel: EmojiMemoryGame // probably want to cll something cooler like game
    
    var body: some View {
            ScrollView {
                Text("Memorize")
                    .font(.largeTitle)
                    // LazyVGrid uses all width horizontally, vertically it makes the cards as small as possible so it can make as many as possible
                    // GridItems allows you to set adaptive so it looks good in portrait and landscape mode
                    LazyVGrid(columns:
                                [GridItem(.adaptive(minimum: 65))]) {
                        // id helps uniquely identify each view the foreach makes
                        ForEach(viewModel.cards) { card in
                            CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                                .onTapGesture {
                                    viewModel.choose(card)
                                }
                        }
                    }
            }
            .foregroundColor(.red)
            .padding(.horizontal)
        }
    }
    
//    var animalTheme: some View {
//        Button {
//            emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🦄", "🐥", "🐙", "🐢", "🦀", "🦧", "🐳", "🦭", "🦞"]
//            emojis = emojis.shuffled()
//            emojiCount = Int.random(in: 8...24)
//
//        } label: {
//            VStack {
//                Text("Animal\n Theme")
//                    .font(.subheadline)
//                Image(systemName: "pawprint.circle")
//            }
//        }
//    }
//
//    var natureTheme: some View {
//        Button {
//            emojis = ["🌵", "🌲", "🌳", "🌴", "🪵", "🌱", "☘️", "🍀", "🍁", "🌷", "🌺", "🌸", "🌼", "🌙", "❄️", "☀️", "🌿", "🪴", "🍄", "🌹", "⭐️", "🔥", "🌧️", "🌊"]
//            emojis = emojis.shuffled()
//            emojiCount = Int.random(in: 8...24)
//        } label: {
//            VStack {
//                Text("Nature\n Theme")
//                    .font(.subheadline)
//                Image(systemName: "sun.and.horizon.circle")        }
//        }
//    }
//
//    var vehicleTheme: some View {
//        Button {
//            emojis = ["✈️", "🚗", "🚂", "🚀", "🚌", "🚙", "🚕", "🏎", "🚜", "🚐", "🛻", "🚒", "🚚", "🚛", "🏍", "🛸", "🚁", "🚆", "🚎", "🚓", "🛵", "🛳", "🚘", "🚖 "]
//            emojis = emojis.shuffled()
//            emojiCount = Int.random(in: 8...24)
//        } label: {
//            VStack {
//                Text("Vehicle\n Theme")
//                    .font(.subheadline)
//                Image(systemName: "car.circle")
//            }
//        }
//    }
    
//    func widthThatFitsBest() -> CGFloat {
//        if emojiCount <= 24 && emojiCount >= 17 {
//            return 65
//        } else if emojiCount <= 16 && emojiCount >= 10 {
//            return 80
//        } else {
//            return 85
//        }
//    }

struct CardView: View {
    // can't make it a var, this is a read-only, @State is rare in a view
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            // local variable/constant
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
                    .foregroundColor(.orange)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
//        // flip the card w/o animation
//        .onTapGesture {
//            self.card.isFaceUp.toggle()
//        }
    }
}





















// Controls how the preview works, can make a simulator for each one
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
