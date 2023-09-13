//
//  ContentView.swift
//  Concentration
//
//  Created by Xiang Yu Tuang on 12/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            let emojis: [String] = ["😀","😭","🥵","😇"]
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .imageScale(.large)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
            }
            else{
                base.fill()
            }
            
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
