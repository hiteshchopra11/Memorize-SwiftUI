//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Hitesh Chopra on 25/07/21.
//

/* Swift's introduction brought us significant shifts in the way we build products. For example, we went from...
 ...everything is an object to everything is a protocol (admittedly, we took this one too much to the latter)
 ...everything is a class to prefer value types wherever possible
 
 Source -: https://www.fivestars.blog/articles/swiftui-patterns-closures/ */

import SwiftUI

@main
struct MemorizeApp: App {
    
    /* game is a pointer to ViewModel, so our ViewModel can still be changed,
       only the address of the ViewModel in the memory will be immutable */
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel:game)
        }
    }
}
