//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Куаныш Султан on 22.02.2025.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3

    var body: some View {
        VStack {
            cards
                .animation(.default, value: viewModel.cards)
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(items: viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card: card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }.foregroundColor(.green)
    
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
