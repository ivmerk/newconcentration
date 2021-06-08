//
//  ViewController.swift
//  Concentration
//
//  Created by Ivan Merkulov on 29.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = ConcentrationGame(numberOfPairsOfCards: (buttonCollection.count + 1) / 2)
    
    var touches = 0 {
        didSet {
            touchLebel.text = "Touches: \(touches)"
        }
    }
    
    var emojiCollection = ["🐱","🐭","🐹","🐰","🦊","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷","🐽","🐸","🐱","🐭","🐹","🐰","🦊","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷","🐽","🐸"]
                           //"🐗","🐴","🦄","🐝","🪱"]
    lazy var arrayOfIdentifiertmp: [Int] = Array (1...buttonCollection.capacity/2)
    lazy var arrayOfIdentifier: [Int] = arrayOfIdentifiertmp + arrayOfIdentifiertmp
    
   
    var emojiDictionary = [Int: String]()
    
    var emojiWhichChoosed = Set<Int>()
    
  /*  func emojiIdentifier(for card: Card) -> String{
        if emojiDictionary[card.identifier] == nil {
            var randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            if randomIndex > emojiDictionary.count/2 {
                randomIndex -= emojiDictionary.count/2 
            }
            if  !emojiWhichChoosed.contains(randomIndex){
                emojiDictionary[card.identifier] = emojiCollection[randomIndex]
                emojiWhichChoosed.insert(randomIndex)
            } else {emojiDictionary[card.identifier] = emojiCollection.remove(at: randomIndex)}
        }
        if emojiDictionary[card.identifier] != nil {
            return (emojiDictionary[card.identifier]! + String(card.identifier))
        } else {
            return "?"  // можно еще return emojiDictionary[card.identifier]! ?? "?"
        }
    }*/
    func emojiIdentifier(for card: Card) -> String{
          if emojiDictionary[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(arrayOfIdentifier.count)))
//              if randomIndex > emojiDictionary.count/2 {
  //                randomIndex -= emojiDictionary.count/2
    //          }
            let memberOfArraeOfIdentifier = arrayOfIdentifier.remove(at: randomIndex)
            if  !emojiWhichChoosed.contains(memberOfArraeOfIdentifier){
                  emojiDictionary[card.identifier] = emojiCollection[memberOfArraeOfIdentifier]
                  emojiWhichChoosed.insert(memberOfArraeOfIdentifier)
              } else {emojiDictionary[card.identifier] = emojiCollection.remove(at: memberOfArraeOfIdentifier)}
          }
          if emojiDictionary[card.identifier] != nil {
              return (emojiDictionary[card.identifier]! + String(card.identifier))
          } else {
              return "?"  // можно еще return emojiDictionary[card.identifier]! ?? "?"
          }
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
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchLebel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1;
        if let buttonIndex = buttonCollection.firstIndex(of: sender){
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
}

