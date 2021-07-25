//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Hitesh Chopra on 25/07/21.
//

import Foundation

// CardContent is used to describe a generic type, it can be anything
struct MemoryGame<CardContent> where CardContent : Equatable {
    
    /* private(set) tells other classes that they can look at the model, but can't modify the same.
     Hence this is read only. */
    
    private(set) var cards : Array<Card>
    
    private var indexOfTheOneAndOnlyFacedUpCard : Int?
    
    // Any function, which needs to be mutated, should start with a mutating keyword.
    mutating func choose( _ card:Card){
        
        /* All arguments to functions are let, so we can't just simply set any boolean value to false
         card.isFaceUp.toggle() */
        
        /* In structs, when we use var, we are just making a copy of the assigned variable,
         means that even assigning cards to choseCard var copies to the latter.
         So, we need to change the card recieved from the viewModel directly instead of creating
         var inside the struct  */
        
        /* We cannot use && in if if it has "let", we use comma(",") instead. */
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFacedUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFacedUpCard {
                
                // To use "==" opertaor with generics we need to set our GenericType to Equatable
                if(cards[chosenIndex].content == cards[potentialMatchIndex].content) {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFacedUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFacedUp = false
                }
                indexOfTheOneAndOnlyFacedUpCard = chosenIndex
            }
            cards[chosenIndex].isFacedUp.toggle()
        }
    }
    
    // of is external name(while passing), card is internal namewhile defining
    func index(of card : Card) -> Int? {
        for index in 0..<cards.count {
            if(cards[index].id == card.id){
                return index
            }
        }
        return nil
    }
    
    // Initializer
    init(numberOfPairsOfCards : Int , createCardContent : (Int) -> CardContent ) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content : content , id:pairIndex*2))
            cards.append(Card(content : content , id:pairIndex*2+1))
        }
    }
    
    struct Card : Identifiable {
        var isFacedUp : Bool = false
        var isMatched : Bool = false
        var content : CardContent
        // If we use Identifiable, we need to pass a unique id
        var id : Int
    }
}
