//
//  ContentView.swift
//  Concentration
//
//  Created by Xiang Yu Tuang on 12/9/23.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["😀","😭","🥵","😇","😀","😭","🥵","😇","😀","😭","🥵","😇"]
    @State var cardCount: Int = 4
    var body: some View {
        
        VStack{
            ScrollView {
                Cards
            }
            Spacer()
            CardCountAdjusters
        }
        .padding()
        
    }
    var Cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
        .imageScale(.large)
    }
    
    var CardCountAdjusters: some View {
        return HStack{
            CardAdder
            Spacer()
            CardRemover
            
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    func cardCountAdjusters(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var CardRemover: some View {
        cardCountAdjusters(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    var CardAdder: some View {
        cardCountAdjusters(by: 1, symbol: "rectangle.stack.fill.badge.plus")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
