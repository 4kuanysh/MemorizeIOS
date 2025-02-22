//
//  ContentView.swift
//  Memorize
//
//  Created by Куаныш Султан on 22.02.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.green)
        .font(.largeTitle)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if (isFaceUp) {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(lineWidth: 2)
                Text("🔥")
            } else {
                RoundedRectangle(cornerRadius: 16)
            }
        }
    }
}

#Preview {
    ContentView()
}
