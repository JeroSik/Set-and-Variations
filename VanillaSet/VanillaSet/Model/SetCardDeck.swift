//
//  SetCardDeck.swift
//  VanillaSet
//
//  Created by Youngsik Yoon on 5/22/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import Foundation

struct SetCardDeck {
    private(set) var cards = [SetCard]()
    
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
    
    
    // Draw a random card if there are cards in the deck
    mutating func draw() -> SetCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
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
