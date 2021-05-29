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
    
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchLebel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1;
    }
}

