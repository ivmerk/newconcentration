//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Ivan Merkulov on 30.05.2021.
//

import Foundation

class ConcentrationGame {
    
    private(set) var cards = [Card]()

    private var indexOfOneAndOnlyFaceUpCard: Int?{
        get{
            var foundIndex: Int?
            for index in cards.indices{   //проверяем есть ли перевернутые карточки
                if cards[index].isFaceUp{
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched{
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index{
                if cards[matchingIndex].identifier == cards[index].identifier{
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        
        
        }
    }
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
        for index in 0...numberOfPairsOfCards*2-1{
            let tmp = cards[index].identifier
            let randomIdentifier = Int(arc4random_uniform(UInt32(numberOfPairsOfCards*2)))
            cards[index].identifier = cards[randomIdentifier].identifier
            cards[randomIdentifier].identifier = tmp
        }
    }
    
}
