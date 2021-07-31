//
//  ContentView.swift
//  Memorize
//
//  Created by Hitesh Chopra on 25/07/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    /* var as it is not stored in memory, it's calculated by
     executing this(some View {}) function */
    
    /* Redraw views when something changes(observable publishes the changes from the viewmodel)
     and to achieve that we add an @ObservedObject keyword before our viewmodel, so that automatically
     observes the changes from the viewmodel.*/
    
    @ObservedObject var game: EmojiMemoryGame
    
    /* Body means give me a UI that shows me what's in a Model */
    var body: some View {
        AspectVGrid(items:game.cards , aspectRatio : 2/3) { card in
            cardView(for: card)
        }
        .padding(.horizontal).padding(.vertical)
        .foregroundColor(.red)
    }
    
    @ViewBuilder
    private func cardView(for card: EmojiMemoryGame.Card) -> some View {
        if card.isMatched && !card.isFacedUp {
            Rectangle().opacity(0)
        } else{
            CardView(card:card)
                .padding(4)
                .onTapGesture {
                    // Express User's intent to perform an action
                    game.choose(card)
                }
        }
    }
    
}



struct CardView: View {
    let card : EmojiMemoryGame.Card
    
    var body: some View{
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius:DrawingConstants.cornerRadius)
                if(card.isFacedUp) {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth:DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 30)).padding(5).opacity(0.5)
                    Text(card.content).font(font(in : geometry.size)).opacity(0.8)
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size:CGSize) -> Font {
        Font.system(size:min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth : CGFloat = 3
        static let fontScale : CGFloat = 0.75
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game:game).previewDevice("iPhone 12").preferredColorScheme(.dark)
        EmojiMemoryGameView(game:game).previewDevice("iPhone 12").preferredColorScheme(.light)
    }
}
