//
//  ViewController.swift
//  Concentration
//
//  Created by Ivan Merkulov on 29.05.2021.
//

import UIKit

class ViewController: UIViewController {

    var touches = 0 {
        didSet {
            touchLebel.text = "Touches: \(touches)"
        }
    }
    
    func flipButton(emoji: String, button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    let emojiCollection = ["🦊", "🐰","🦊", "🐰"]
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchLebel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1;
        flipButton(emoji: emojiCollection[0], button: sender)
    }
}

