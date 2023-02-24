//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Harley, Alexandra on 1/30/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    // game is a pointer to a CLASS. classes are mutable, so the pointer to the class is the constant in this case, and the class is mutable (all classes are) so it can change and play the game 
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
