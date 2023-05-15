//
//  ContentView.swift
//  Memorize
//
//  Created by Alexandra Harley on 5/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🇯🇲", "🇫🇷", "🇺🇸", "🇰🇷", "🇬🇧", "🏳️‍🌈", "🇧🇸", "🇨🇦", "🇧🇷", "🇧🇪", "🇨🇮", "🇪🇨", "🇨🇺", "🇮🇹", "🇮🇷", "🇯🇵", "🇰🇪", "🇳🇴", "🇿🇦", "🇸🇪", "🇹🇹", "🇺🇦", "🇰🇳", "🇪🇸"]
    var animalEmojis = ["🐶","🐱","🐭", "🐹", "🐰","🦊","🐻", "🐼", "🐻‍❄️","🐨","🐯", "🦁", "🐮","🐷","🐸", "🐵"]
    var natureEmojis = ["🌵","🌲","🌴", "☘️", "🎋","🌺","🌸", "🌼", "🌪️","🌦️","🌞", "❄️"]
    var sportsEmojis = ["🏂","🏋🏾‍♀️","🤸🏾‍♀️", "🤺","⛹🏾‍♂️","🏌🏾‍♀️","🧘🏾‍♀️", "🤾🏾‍♀️","🏇🏾","🤽🏾‍♀️","🏄🏾‍♀️", "🚣🏾‍♀️","🧗🏾‍♀️","🚴🏾‍♀️","🚵🏾‍♀️", "🥇","🏀","🏈","⚾️", "🎾"]
    var flagEmojis = ["🇯🇲", "🇫🇷", "🇺🇸", "🇰🇷", "🇬🇧", "🏳️‍🌈", "🇧🇸", "🇨🇦", "🇧🇷", "🇧🇪", "🇨🇮", "🇪🇨", "🇨🇺", "🇮🇹", "🇮🇷", "🇯🇵", "🇰🇪", "🇳🇴", "🇿🇦", "🇸🇪", "🇹🇹", "🇺🇦", "🇰🇳", "🇪🇸"]
    @State var emojiCount = Int.random(in: 4..<24)
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatFitsBest()))]) {
                        ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit) //fits as we add more columns to 2/3 ratio
                        }
                    }
                }
                .foregroundColor(.red)
                .padding(5)
                Spacer()
                            HStack {
                                VStack {
                                    animalButton
                                    Text("Animals")
                                        .font(.title3)
                                }
                                Spacer()
                                VStack {
                                    natureButton
                                    Text("Nature")
                                        .font(.title3)
                                }
                                Spacer()
                                VStack {
                                    sportButton
                                    Text("Sports")
                                        .font(.title3)
                                }
                                Spacer()
                                VStack {
                                    flagButton
                                    Text("Flags")
                                        .font(.title3)
                                }
                            }
                    .padding(.horizontal)
                    .font(.largeTitle)
            }
            .navigationTitle("Memorize!")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var animalButton: some View {
        Button(action: {
            emojis = animalEmojis
            randomizeCards()
            
        }, label: {
            Image(systemName: "pawprint.circle.fill")
        })
    }
    
    var natureButton: some View {
        Button(action: {
            emojis = natureEmojis
            randomizeCards()
        }, label: {
            Image(systemName: "mountain.2.circle.fill")
        })
    }
    
    var flagButton: some View {
        Button(action: {
            emojis = flagEmojis
            randomizeCards()
        }, label: {
            Image(systemName: "flag.circle.fill")
        })
    }
    
    var sportButton: some View {
        Button(action: {
            emojis = sportsEmojis
            randomizeCards()
        }, label: {
            Image(systemName: "figure.run.circle.fill")
        })
    }
    
    func randomizeCards() {
        emojis.shuffle()
        emojiCount = Int.random(in: 4..<emojis.count)
    }
    
    func widthThatFitsBest() -> CGFloat {
        if emojiCount <= 24 && emojiCount >= 17 {
            return 65
        } else if emojiCount <= 16 && emojiCount >= 10 {
            return 80
        } else {
            return 85
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        // How can I toggle isFaceUp back to true when the emojis change?
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}


