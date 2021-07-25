//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Hitesh Chopra on 25/07/21.
//

import Foundation

// CardContent is used to describe a generic type, it can be anything
struct MemoryGame<CardContent> {
    
    /* private(set) tells other classes that they can look at the model, but can't modify the same.
       Hence this is read only. */
    private(set) var cards : Array<Card>
    
    func choose( _ card:Card){
        // TODO Lecture 4
    }
    
    // Initializer
    init(numberOfPairsOfCards : Int , createCardContent : (Int) -> CardContent ) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content:content))
            cards.append(Card(content:content))
        }
    }
    
    struct Card{
        var isFacedUp : Bool = false
        var isMatched : Bool = false
        var content : CardContent
    }
}
