//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Куаныш Султан on 22.02.2025.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
