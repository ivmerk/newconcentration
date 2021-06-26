//
//  ViewController.swift
//  Concentration
//
//  Created by Ivan Merkulov on 29.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = ConcentrationGame(numberOfPairsOfCards: numberOfPairOfCards)
    
    var numberOfPairOfCards: Int{
        return (buttonCollection.count + 1) / 2
    }
    
    private(set) var touches = 0 {
        didSet {
            touchLebel.text = "Touches: \(touches)"
        }
    }
    
   private var emojiCollection = ["🐱","🐭","🐹","🐰","🦊","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷","🐽","🐗","🐴","🦄","🐝","🪱"]

   private var emojiDictionary = [Int: String]()
    
   private var emojiWhichChoosed = Set<Int>()
    
    private func emojiIdentifier(for card: Card) -> String{
          if emojiDictionary[card.identifier] == nil {
            emojiDictionary[card.identifier] = emojiCollection.remove(at: emojiCollection.count.arc4randomExtention)
          }
            return (emojiDictionary[card.identifier]! + String(card.identifier)) ?? "?"
      }

    func updateViewFromModel(){
        for index in buttonCollection.indices{
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for :card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 0): #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
            }
        }
    }
    
    @IBOutlet private var buttonCollection: [UIButton]!
    @IBOutlet private weak var touchLebel: UILabel!
    @IBAction private func buttonAction(_ sender: UIButton) {
        touches += 1;
        if let buttonIndex = buttonCollection.firstIndex(of: sender){
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
}
extension Int {
    var arc4randomExtention: Int{
        return Int(arc4random_uniform(UInt32(self)))
    }
}
