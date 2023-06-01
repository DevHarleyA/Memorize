//
//  ContentView.swift
//  Memorize View
//
//  Created by Alexandra Harley on 5/10/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        NavigationView {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                        ForEach(viewModel.cards){ card in
                            CardView(card: card)
                                .aspectRatio(2/3, contentMode: .fit) //fits as we add more columns to 2/3 ratio
                                .onTapGesture {
                                    viewModel.choose(card)
                                }
                        }
                    }
                }
                .foregroundColor(.red)
                .padding(5)
                Spacer()
        }
        .navigationTitle("Memorize!")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card // card can not change, don't make it a var unless you use @State
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                // make the cards fully transparent if matched, maintain space card takes up
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}


