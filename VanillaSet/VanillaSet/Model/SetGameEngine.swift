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
    private(set) var selectedCards = [SetCard]()
    
    func chooseCard(at index: Int) {
        assert(deck.cards.indices.contains(index), "SetGameEngine.chooseCard(at: \(index)): choosen index not in cards")

        // Deselect card if the card has already been selected
        if selectedCards.contains(deck.cards[index]) {
            
        }
        // if 3 cards are choosen, then check if a proper set
        
    }
    
    func isSet() -> Bool {
        return true
    }
}
