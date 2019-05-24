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
    @IBAction func cardButtonPressed(_ sender: UIButton) {
    }
    
    // Handles behavior of dealing three more cards if possible
    @IBOutlet weak var dealThreeMoreCardsButton: UIButton!
    @IBAction func dealThreeMoreCardsButtonPressed(_ sender: UIButton) {
        gameEngine.draw()
        updateCardsOnTable()
        toggleDealThreeMoreCardsButton()
    }
    
    // Enables and disables deal three more cards buttons when necessary
    func toggleDealThreeMoreCardsButton() {
        if gameEngine.cardsOnTable.count == 24 {
            dealThreeMoreCardsButton.isEnabled = false
        } else {
            dealThreeMoreCardsButton.isEnabled = true
        }
    }
    
    // Change the button card views with the appropriate card titles
    func updateCardsOnTable() {
        for (index, card) in gameEngine.cardsOnTable.enumerated() {
            cardButtons[index].setAttributedTitle(getCardAttributedString(of: card), for: UIControl.State.normal)
            cardButtons[index].backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    // Get the NSAttirbuedString from a SetCard data type
    func getCardAttributedString(of card: SetCard) -> NSAttributedString {
        var cardTitle = ModelToView.title[card.shape]!
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeColor: ModelToView.color[card.color]!,
            .strokeWidth: ModelToView.width[card.shading]!,
            .foregroundColor: ModelToView.color[card.color]!.withAlphaComponent(ModelToView.alpha[card.shading]!),
        ]
        
        switch card.number {
            case .two: cardTitle = "\(cardTitle)\(cardTitle)"
            case .three: cardTitle = "\(cardTitle)\(cardTitle)\(cardTitle)"
            default: break
        }
        
        return NSAttributedString(string: cardTitle, attributes: attributes)
    }
    
    // Score tracker for the game
    @IBOutlet weak var scoreLabel: UILabel!
    func updateScore() {
        scoreLabel.text = "\(gameEngine.score)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCardsOnTable()
    }
}

// Data type to hold NSAttributeString properties
struct ModelToView {
    static let title: [SetCard.Shape: String] = [.triangle: "▲", .square: "■", .circle: "●"]
    static let color: [SetCard.Color: UIColor] = [.red: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), .green: #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1), .blue: #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)]
    static let alpha: [SetCard.Shading: CGFloat] = [.solid: 1.0, .empty: 0.40, .stripe: 0.15]
    static let width: [SetCard.Shading: CGFloat] = [.solid: -5, .empty: 5, .stripe: -5]
}
