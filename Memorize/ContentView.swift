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
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 16)
            if (isFaceUp) {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("🔥")
            } else {
                base
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



































#Preview {
    ContentView()
}
