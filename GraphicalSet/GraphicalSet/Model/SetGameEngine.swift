//
//  SetGameEngine.swift
//  GraphicalSet
//
//  Created by Youngsik Yoon on 5/28/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import Foundation

struct SetGameEngine {
    // Initialize deck of cards, selected cards
    private var deck = SetCardDeck()
    private(set) var score = 0
    private(set) var cardsOnTable = Array<SetCard>()
    private(set) var hintCards = [Int]()
    private var selectedCards = Set<SetCard>()
    
    // Handle behavior for choosing card
    mutating func chooseCard(at index: Int) {
        assert(deck.cards.indices.contains(index), "SetGameEngine.chooseCard(at: \(index)): choosen index not in cards")
        let currentCard = cardsOnTable[index]
        
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
                    var cardIndices = Array<Int>()
                    for card in selectedCards {
                        cardIndices.append(cardsOnTable.firstIndex(of: card)!)
                    }
                    draw(at: cardIndices)
                    score += 3
                } else {
                    score -= 5
                }
                
                selectedCards.removeAll()
            }
        }
    }
    
    // Handle behavior for finding hints within the current cards on table
    mutating func hint() {
        hintCards.removeAll()
        
        for cardOne in 0 ..< cardsOnTable.count {
            for cardTwo in (cardOne + 1) ..< cardsOnTable.count {
                for cardThree in (cardTwo + 1) ..< cardsOnTable.count {
                    let hints = [cardsOnTable[cardOne], cardsOnTable[cardTwo], cardsOnTable[cardThree]]
                    if isSet(on: Set(hints)) {
                        hintCards += [cardOne, cardTwo, cardThree]
                        return
                    }
                }
            }
        }
        
        score -= 5
    }
    
    // Handle behavior from drawing cards from the deck
    mutating func draw(at cardIndices: Array<Int> = []) {
        for index in 0...2 {
            if let drawnCard = deck.draw() {
                if cardIndices.isEmpty {
                    cardsOnTable.append(drawnCard)
                } else {
                    cardsOnTable[cardIndices[index]] = drawnCard
                }
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
    
    // Initialize the cards on table at start of game
    mutating func initCardsOnTable() {
        for _ in 1...4 {
            draw()
        }
    }
    
    // Initialize the game engine
    init() {
        initCardsOnTable()
    }
}
