//
//  ContentView.swift
//  Memorize
//
//  Created by Hitesh Chopra on 25/07/21.
//

import SwiftUI

struct ContentView: View {
    
    let allEmojis = ["😀","😁","😂","😃","😄","😅","😆","😇","😈","👿","😉","😊","☺️","😋","😌","😍","😎","😏","😐","😑","😒","😓","😔","😕","😖","😗","😘","😙","😚","😛","😜"]
    @State var emojiCount = 25

    // var bcoz is not stored in memory, it's calculated by
    // executing this(some View {}) function
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.title)
                
            ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(allEmojis[0..<emojiCount], id:\.self) { emoji in
                    CardView(content:emoji).aspectRatio(2/3,contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                }
                }.padding(.horizontal).padding(.vertical)
                .foregroundColor(.red)
            }
        }
    }
}



struct CardView: View {
    var content : String
    @State var isFaceUp = false
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if(isFaceUp) {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth:3.0)
                Text(content).font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius:20.0).fill(Color.red)
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 12").preferredColorScheme(.dark)
        ContentView().previewDevice("iPhone 12").preferredColorScheme(.light)
    }
}
