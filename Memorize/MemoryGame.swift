//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Hitesh Chopra on 25/07/21.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards : Array<Card>
    
    func choose( _ card:Card){
        
    }
    
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
