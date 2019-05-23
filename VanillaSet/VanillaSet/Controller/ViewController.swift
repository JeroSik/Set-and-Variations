//
//  ViewController.swift
//  VanillaSet
//
//  Created by Youngsik Yoon on 5/22/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var gameEngine = SetGameEngine()
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func dealThreeMoreCardsButtonPressed(_ sender: UIButton) {
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    func updateScore() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
