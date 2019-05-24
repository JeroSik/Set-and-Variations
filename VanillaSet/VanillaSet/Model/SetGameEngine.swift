//
//  SetGameEngine.swift
//  VanillaSet
//
//  Created by Youngsik Yoon on 5/22/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//
//  --

import Foundation

struct SetGameEngine {
    // Initialize deck of cards, selected cards
    private var deck = SetCardDeck()
    private(set) var score = 0
    private(set) var cardsOnTable = Array<SetCard>()
    private var selectedCards = Set<SetCard>()
    
    
    // Handle behavior for choosing card
    mutating func chooseCard(at index: Int) {
        assert(deck.cards.indices.contains(index), "SetGameEngine.chooseCard(at: \(index)): choosen index not in cards")
        let currentCard = deck.cards[index]
        
        // Deselect current card if the card has already been selected
        if selectedCards.contains(currentCard) {
            selectedCards.remove(currentCard)
            score -= 1
        } else {
            // Add current card to selected cards
            selectedCards.insert(currentCard)
            
            // If third card, then check if the selected cards is a set
            if selectedCards.count == 3 {
                if isSet(on: selectedCards) {
                    for cards in selectedCards {
                        cardsOnTable.remove(at: cardsOnTable.firstIndex(of: cards)!)
                    }
                    draw()
                    selectedCards.removeAll()
                    score += 3
                } else {
                    score -= 5
                }
            }
        }
        // if 3 cards are choosen, then check if a proper set
        
    }
    
    mutating func draw() {
        for _ in 1...3 {
            if let drawnCard = deck.draw() {
                cardsOnTable.append(drawnCard)
            }
        }
    }
    
    // Given a set, return whether cards match or not
    func isSet(on currentSet: Set<SetCard>) -> Bool {
        let shapeSet = Set(currentSet.map { $0.shape }).count
        let numberSet = Set(currentSet.map { $0.number }).count
        let shadingSet = Set(currentSet.map { $0.shading }).count
        let colorSet = Set(currentSet.map { $0.color }).count
        
        return shapeSet != 2 && numberSet != 2 && shadingSet != 2 && colorSet != 2
    }
    
    mutating func initCardsOnTable() {
        for _ in 1...4 {
            draw()
        }
    }
    
    init() {
        initCardsOnTable()
    }
}
