//
//  MemoryGame.swift
//  Memorize
//
//  Created by kunal more on 17/02/22.
//  Model file

import Foundation

struct MemoryGame<CardContent: Equatable>{
    //Array for holding content of the card
    private(set) var cards: Array<Cards> 
    private var indexOfOneAndOnlyFaceUp : Int?
    private(set) var score: Int
    
    mutating func choose(_ card: Cards){
        if let choosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[choosenIndex].isFaceup,
           !cards[choosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfOneAndOnlyFaceUp{
                if cards[choosenIndex].content == cards[potentialMatchIndex].content{
                    cards[choosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score = score + 2
                    print("comes here 2nd \(String(describing: indexOfOneAndOnlyFaceUp)) and \n score is \(score) \n")

                }else{
                    let negative = cards[choosenIndex].alreadyseen - 1 + cards[indexOfOneAndOnlyFaceUp!].alreadyseen - 1
                    score = score - negative
                }
                print("comes here 3rd \(String(describing: indexOfOneAndOnlyFaceUp)) \n")
                indexOfOneAndOnlyFaceUp = nil
            }else{
                for index in cards.indices{
                    cards[index].isFaceup = false
                }
                print("comes here 1st \(String(describing: indexOfOneAndOnlyFaceUp)) \n")
                indexOfOneAndOnlyFaceUp = choosenIndex
            }
            cards[choosenIndex].isFaceup.toggle()
            cards[choosenIndex].alreadyseen += 1
            print("value of already seen \(cards[choosenIndex].alreadyseen)")
        }
        print("Choosen card = \(cards) \n")
        
    }
    //initializer for cards content
    init(NumberOfPairOfCards: Int,CreateCardContent:(Int)->CardContent){
        cards = Array<Cards>()
        score = 0
        for PairIndex in 0..<NumberOfPairOfCards {
            let content : CardContent = CreateCardContent(PairIndex)
            cards.append(Cards(id: PairIndex*2, content: content))
            cards.append(Cards(id: PairIndex*2+1, content: content))
        }
        cards.shuffle()
    }
    
    //Structure of the cards
    struct Cards: Identifiable{
        var id: Int
        var isFaceup: Bool = false;
        var isMatched: Bool = false;
        var content : CardContent
        var alreadyseen : Int = 0
    }
}
