//
//  ContentView.swift
//  Memorize
//
//  Created by Hitesh Chopra on 25/07/21.
//

import SwiftUI

struct ContentView: View {
    /* var as it is not stored in memory, it's calculated by
     executing this(some View {}) function */
        
    /* Redraw views when something changes(observable publishes the changes from the viewmodel)
       and to achieve that we add an @ObservedObject keyword before our viewmodel, so that automatically
       observes the changes from the viewmodel.*/
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    /* Body means give me a UI that shows me what's in a Model */
    var body: some View {
        Text("Memorize!")
            .font(.title)
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                
                /* Make our cards identifiable, because ForEach requires array
                   to be identifiable. To solve this, we make our Cards as Identifiable in ViewModel
                   by adding Identifiable keyword to the */
                
                ForEach(viewModel.cards) { card in
                    CardView(card:card).aspectRatio(2/3,contentMode: .fit)
                        .onTapGesture {
                            // Express User's intent to perform an action
                            viewModel.choose(card)
                        }
                }
            }.padding(.horizontal).padding(.vertical)
            .foregroundColor(.red)
        }
    }
}



struct CardView: View {
    let card : MemoryGame<String>.Card
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if(card.isFacedUp) {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth:3.0)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                RoundedRectangle(cornerRadius:20.0).fill(Color.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel:game).previewDevice("iPhone 12").preferredColorScheme(.dark)
        ContentView(viewModel:game).previewDevice("iPhone 12").preferredColorScheme(.light)
    }
}
