//
//  MemoryGame.swift
//  Memorize
//
//  Created by Hitesh Chopra on 25/07/21.
//


// This is our ViewModel Class
import Foundation

class EmojiMemoryGame {
    
    /* We use static because the order in which the properties are initialized are
       random, it's not in order, so createMemoryGame simply can't depend on allEmojis
       because it is not gauranteed that allEmojis is initialized before createMemoryGame().
       
     We can solve this by-:
     
     1. We can move it outside the EmojiMemoryGame and make it global, but emojis
        are not required anywhere else except this class, as global values are exposed everywhere
        and we don't want that. We just want it inside EmojiMemoryGame class.
     2. We can use static and allow it only to be used under EmojiMemoryGame. */
    
    /* Note that static functions or var is not an instance of the class, it is a part of Class
       itself and created and used throughout the lifecycle of the app only once, unlike instance members,
       which are created everytime a class is created. */
    
    private static let allEmojis = ["😀","😁","😂","😃","😄","😅","😆","😇","😈","👿","😉","😊","☺️","😋","😌","😍","😎","😏","😐","😑","😒","😓","😔","😕","😖","😗","😘","😙","😚","😛","😜"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        
        /* "pairIndex in" stands for Integer argument that the createCardContent
            function of the MemoryGame struct accepts. "in" is a keyword which seperates the
            arguments with the function body. */
        
        MemoryGame<String>(numberOfPairsOfCards:4) { pairIndex in
            EmojiMemoryGame.allEmojis[pairIndex]
        }
    }
    
    /* private(set) tells other classes that they can look at the model, but can't modify the same.
       Hence this is read only.
    
       private(set) var model : MemoryGame<String> = EmojiMemoryGame.createMemoryGame() */
    
    /* Or else we can set model as private and create a new instance which returns the model.
       This will also be read only. */
    
    private var model : MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    // This is an inline function
    var cards : Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
