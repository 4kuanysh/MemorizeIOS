//
//  CardView.swift
//  Memorize
//
//  Created by Куаныш Султан on 06.04.2025.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    typealias Card = MemoryGame<String>.Card
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay {
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
            }
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
}

#Preview {
    VStack {
        HStack {
            CardView(card: CardView.Card(isFaceUp: true, content: "🦺", id: "test1"))
            CardView(card: CardView.Card(content: "🦺", id: "test2"))
        }
        HStack {
            CardView(card: CardView.Card(isMatched: true, content: "🦺", id: "test3"))
            CardView(card: CardView.Card(isMatched: false, content: "🦺", id: "test4"))
        }
    }
    .padding()
    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
}
