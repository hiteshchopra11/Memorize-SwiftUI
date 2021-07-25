//
//  MemoryGame.swift
//  Memorize
//
//  Created by Hitesh Chopra on 25/07/21.
//

import Foundation

class EmojiMemoryGame {
    
    static let allEmojis = ["😀","😁","😂","😃","😄","😅","😆","😇","😈","👿","😉","😊","☺️","😋","😌","😍","😎","😏","😐","😑","😒","😓","😔","😕","😖","😗","😘","😙","😚","😛","😜"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards:4) { pairIndex in
            EmojiMemoryGame.allEmojis[pairIndex]
        }
    }
    
    private var model : MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards : Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
