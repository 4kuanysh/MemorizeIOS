//
//  ContentView.swift
//  Memorize
//
//  Created by Куаныш Султан on 22.02.2025.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["🔥", "🏛️", "☠️", "🕸️", "🔥", "🏛️", "☠️", "🕸️", "🔥", "🏛️", "☠️", "🕸️"]
    
    @State var cardCounter = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCounter, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
                .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.green)
        .font(.largeTitle)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCounter += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCounter + offset < 1 || cardCounter + offset > emojis.count)
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 16)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
            }.opacity(isFaceUp ? 0 : 1)
            base.opacity(isFaceUp ? 1 : 0)
        
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



































#Preview {
    ContentView()
}
