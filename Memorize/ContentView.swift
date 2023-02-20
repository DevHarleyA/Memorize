//
//  ContentView.swift
//  Memorize
//
//  Created by Harley, Alexandra on 1/30/23.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["✈️", "🚗", "🚂", "🚀", "🚌", "🚙", "🚕", "🏎", "🚜", "🚐", "🛻", "🚒", "🚚", "🚛", "🏍", "🛸", "🚁", "🚆", "🚎", "🚓", "🛵", "🛳", "🚘", "🚖 "]
    @State var emojiCount = Int.random(in: 8...20)

    var body: some View {
        VStack {
            ScrollView {
                Text("Memorize")
                    .font(.largeTitle)
                HStack {
                    // LazyVGrid uses all width horizontally, vertically it makes the cards as small as possible so it can make as many as possible
                    // GridItems allows you to set adaptive so it looks good in portrait and landscape mode
                    LazyVGrid(columns:
                            // TODO: Try to come up with some sort of equation that relates the number of cards in the game to the width you pass when you create your LazyVGrid’s GridItem(.adaptive(minimum:maximum:)) such that each time a theme button is chosen, the LazyVGrid makes the cards as big as possible without having to scroll.
                            [GridItem(.adaptive(minimum: 65))]) {
                        // id helps uniquely identify each view the foreach makes
                        ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack(spacing: 20) {
                animalTheme
                natureTheme
                vehicleTheme
//                remove
//                Spacer()
//                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }

    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }

    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            // use images from SF Symbols
            Image(systemName: "plus.circle")
        }
    }
    
    var animalTheme: some View {
        Button {
            emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🦄", "🐥", "🐙", "🐢", "🦀"]
            emojis.shuffled()
            emojiCount = Int.random(in: 8...20)
            
        } label: {
            VStack {
                Text("Animal\n Theme")
                    .font(.subheadline)
                Image(systemName: "pawprint.circle")
            }
        }
    }
    
    var natureTheme: some View {
        Button {
            emojis = ["🌵", "🌲", "🌳", "🌴", "🪵", "🌱", "☘️", "🍀", "🍁", "🌷", "🌺", "🌸", "🌼", "🌙", "❄️", "☀️", "🌿", "🪴", "🍄", "🌹"]
            emojis.shuffled()
            emojiCount = Int.random(in: 8...20)
        } label: {
            VStack {
                Text("Nature\n Theme")
                    .font(.subheadline)
                Image(systemName: "sun.and.horizon.circle")        }
        }
    }
    
    var vehicleTheme: some View {
        Button {
            emojis = ["✈️", "🚗", "🚂", "🚀", "🚌", "🚙", "🚕", "🏎", "🚜", "🚐", "🛻", "🚒", "🚚", "🚛", "🏍", "🛸", "🚁", "🚆", "🚎", "🚓", "🛵", "🛳", "🚘", "🚖 "]
            emojis.shuffled()
            emojiCount = Int.random(in: 8...20)
        } label: {
            VStack {
                Text("Vehicle\n Theme")
                    .font(.subheadline)
                Image(systemName: "car.circle")
            }
        }
    }
}

struct CardView: View {
    var content: String
    // variable must always have a value, if not set in view, creator will have to define above
    // creator wins if you provide default value and they provide a different value in function call
    @State var isFaceUp: Bool = true

    var body: some View {
        ZStack {
            // local variable/constant
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
                    .foregroundColor(.orange)
            } else {
                shape.fill()
            }
        }
        // flip the card w/o animation
        .onTapGesture {
            self.isFaceUp.toggle()
        }
    }
}





















// Controls how the preview works, can make a simulator for each one
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
