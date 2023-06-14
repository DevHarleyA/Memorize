//
//  EmojiMemoryGameView.swift
//  Memorize View
//
//  Created by Alexandra Harley on 5/10/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            VStack{
                Text("Memorize Game")
                    .font(.title)
                HStack {
                    Text(viewModel.themeName)
                        .font(.title2)
                    Text("\(viewModel.score)")
                }
            }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatFitsBest()))]) {
                ForEach(viewModel.cards){ card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
            newGameButton
        }
        .foregroundColor(Color(viewModel.cardColor))
        .padding(5)
        Spacer()
    }
    
    var newGameButton: some View {
        Button("New Game",
               action: {
            viewModel.createMemoryGame(with: "random")
        })
        .buttonStyle(.bordered)
        .buttonBorderShape(.capsule)
        .padding()
        .font(.subheadline)
    }
    
    func widthThatFitsBest() -> CGFloat {
        let emojiCount = viewModel.themeNumberOfCards
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
        EmojiMemoryGameView(viewModel: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(viewModel: game)
            .preferredColorScheme(.light)
    }
}


