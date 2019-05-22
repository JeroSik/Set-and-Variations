//
//  SetCardDeck.swift
//  VanillaSet
//
//  Created by Youngsik Yoon on 5/22/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//
//  Data type for a deck of cards
//  Contains an array of set cards which are all the unique combinations with the card properties
//  Can draw and remove a random card from the deck

import Foundation

struct SetCardDeck {
    // Array for storing deck of cards
    private(set) var cards = [SetCard]()
    
    // Draw a random card if there are cards in the deck
    mutating func draw() -> SetCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
        }
    }
    
    // Initalize deck of cards with all the unique combinations of card properties
    init() {
        for shape in SetCard.Shape.all {
            for number in SetCard.Number.all {
                for shading in SetCard.Shading.all {
                    for color in SetCard.Color.all {
                        cards.append(SetCard(shape: shape, number: number, shading: shading, color: color))
                    }
                }
            }
        }
    }
}

// Extension for generating a random number in a range
extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
