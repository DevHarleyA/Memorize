//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Alexandra Harley on 5/10/23.
//

import SwiftUI

@main // main program
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game) // This is the thing that describes what our app looks like
        }
    }
}
