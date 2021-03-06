//
//  ContentView.swift
//  Memorize
//
//  Created by Hitesh Chopra on 25/07/21.
//

import SwiftUI

struct ContentView: View {
    
    let allEmojis = ["π","π","π","π","π","π","π","π","π","πΏ","π","π","βΊοΈ","π","π","π","π","π","π","π","π","π","π","π","π","π","π","π","π","π","π"]
    @State var emojiCount = 5

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
            HStack{
                remove
                Spacer()
                add
            }
        }
    }
    
    var remove:some View{
        Button(action: {
            if(emojiCount>0){
                emojiCount-=1
            }
        }
               , label: {
            Image(systemName: "minus.circle").font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
        }).padding(.horizontal).padding(.vertical)
    }
    
    var add:some View{
        Button(action: { if(emojiCount<31){
            emojiCount+=1
        }}, label: {
            Image(systemName: "plus.circle").font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
        }).padding(.horizontal).padding(.vertical)
    }
}



struct CardView: View {
    var content : String
    @State var isFaceUp = false
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if(isFaceUp){
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth:3.0)
                Text(content).font(.largeTitle)
            }else{
                RoundedRectangle(cornerRadius:20.0).fill(Color.red)
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
        
        ContentView().preferredColorScheme(.light)
    }
}
