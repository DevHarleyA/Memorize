//
//  EmojiMemoryGameView.swift
//  Memorize View
//
//  Created by Alexandra Harley on 5/10/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            VStack{
                Text("Memorize Game")
                    .font(.title)
                HStack {
                    Text(game.themeName)
                        .font(.title2)
                    Text("\(game.score)")
                }
            }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatFitsBest()))]) {
                ForEach(game.cards){ card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
            newGameButton
        }
        .foregroundColor(Color(game.cardColor))
        .padding(5)
        Spacer()
    }
    
    var newGameButton: some View {
        Button("New Game",
               action: {
            game.createMemoryGame(with: "random")
        })
        .buttonStyle(.bordered)
        .buttonBorderShape(.capsule)
        .padding()
        .font(.subheadline)
    }
    
    func widthThatFitsBest() -> CGFloat {
        let emojiCount = game.themeNumberOfCards
        if emojiCount >= 17 {
            return 50
        } else if emojiCount <= 16 && emojiCount >= 10 {
            return 60
        } else {
            return 70
        }
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}


struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}


