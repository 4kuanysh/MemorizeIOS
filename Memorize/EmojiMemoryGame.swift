//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Куаныш Султан on 23.02.2025.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis: Array<String> = ["🔥", "🏛️", "☠️", "🕸️", "⌛️", "🔦", "🎉", "🧡", "🎩"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 9) { pairIndex in
            if (emojis.indices.contains(pairIndex)) {
                emojis[pairIndex]
            } else {
                "❌"
            }
        }
    }
    
    @Published var model = createMemoryGame()
    
    // MARK: - Intents
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
