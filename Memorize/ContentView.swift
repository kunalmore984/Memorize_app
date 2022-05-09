//
//  ContentView.swift
//  Memorize
//
//  Created by kunal more on 03/12/21.
//

import SwiftUI

struct ContentView: View {
    //ViewModel instance
    @ObservedObject var viewmodel: EmojiMemoryGame
    @State private var theme = ["Vehicle","Fruits","animals"]
   
    var body: some View {
        VStack{
            Text(Themes.name).foregroundColor(Themes.color)
                .font(.system(size: 28, weight: .bold, design:.serif ))
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(viewmodel.cards){ card in
                        Cardview(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture{
                                viewmodel.choose(card)
                                }
                        }
                }
                .padding(.horizontal)
            }
            Text("Score").font(.system(size: 28, weight: .bold, design:.serif ))
            let score = String(viewmodel.score_card)
            Text(score).font(.system(size: 28, weight: .bold, design:.serif ))
            Button {
                // select a random theme....
                theme.shuffle()
                viewmodel.chooseTheme(theme[0])
                
            } label: {
                Text("New game")
                    .foregroundColor(.red)
                    .font(.system(size: 19, weight: .light, design: .monospaced))
                    .padding(5)
            }
        }
    }
}

struct Cardview: View{
    let card: MemoryGame<String>.Cards
    var body : some View{
            ZStack{
                let shape = RoundedRectangle(cornerRadius: 20)
                if card.isFaceup {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(card.content).font(.largeTitle).fontWeight(.regular).padding()
                }else if card.isMatched{
                    shape.opacity(0)
                }else{
                    shape.foregroundColor(Themes.color)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        //3527let theme = ThemeOfTheGame()
        Group {
            ContentView(viewmodel: game)
                .preferredColorScheme(.light).previewInterfaceOrientation(.portrait)
        }
    }
}
