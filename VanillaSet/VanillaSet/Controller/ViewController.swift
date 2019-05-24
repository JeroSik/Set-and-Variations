//
//  ViewController.swift
//  VanillaSet
//
//  Created by Youngsik Yoon on 5/22/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Setup game engine
    var gameEngine = SetGameEngine()
    
    // Initialize button collection and selected buttons
    @IBOutlet var cardButtons: [UIButton]!
    var selectedButtons = [UIButton]()
    
    // Handle behavior for pressing a card button
    @IBAction func cardButtonPressed(_ sender: UIButton) {
        if let cardIndex = cardButtons.firstIndex(of: sender) {
            if cardIndex < gameEngine.cardsOnTable.count {
                gameEngine.chooseCard(at: cardIndex)
                chooseButton(at: sender)
                updateCardsOnTable()
            }
        }
    }
    
    // Handle behavior for choosing a button
    private func chooseButton(at card: UIButton) {
        assert(cardButtons.contains(card), "ViewController.chooseButton(at \(card)): choosen card not in buttons")
        
        if selectedButtons.contains(card) {
            card.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            card.layer.borderWidth = 3.0
            selectedButtons.remove(at: selectedButtons.firstIndex(of: card)!)
        } else  {
            selectedButtons += [card]
            card.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            card.layer.borderWidth = 3.0
            
            if selectedButtons.count == 3 {
                cardButtons.forEach() { $0.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0) }
                selectedButtons.removeAll()
                updateScore()
            }
        }
    }
    
    
    // Handle behavior for displaying hints
    @IBAction func hintButtonPressed(_ sender: UIButton) {
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
    
    // Handle behavior for new game
    @IBAction func newGameButtonPressed(_ sender: UIButton) {
        gameEngine = SetGameEngine()
        resetButton()
        updateCardsOnTable()
        toggleDealThreeMoreCardsButton()
        updateScore()
        selectedButtons.removeAll()
//        hintedButton.removeAll()
    }
    
    // Change the buttons back to the initial state
    private func resetButton() {
        for button in cardButtons {
            let nsAttributedString = NSAttributedString(string: "")
            button.setAttributedTitle(nsAttributedString, for: UIButton.State.normal)
            button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
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
