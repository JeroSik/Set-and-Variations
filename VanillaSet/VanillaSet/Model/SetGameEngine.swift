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
    private(set) var deck = SetCardDeck()
    private(set) var selectedCards = Set<SetCard>()
    
    // Handle behavior for choosing card
    mutating func chooseCard(at index: Int) {
        assert(deck.cards.indices.contains(index), "SetGameEngine.chooseCard(at: \(index)): choosen index not in cards")
        let currentCard = deck.cards[index]
        
        // Deselect current card if the card has already been selected
        if selectedCards.contains(currentCard) {
            selectedCards.remove(currentCard)
        } else {
            // Add current card to selected cards
            selectedCards.insert(currentCard)
            
            // If third card, then check if the selected cards is a set
            if selectedCards.count == 3 {
                if isSet(on: selectedCards) {
                    
                }
            }
        }
        // if 3 cards are choosen, then check if a proper set
        
    }
    
    func isSet(on set: Set<SetCard>) -> Bool {
        return true
    }
}
