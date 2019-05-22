//
//  SetCard.swift
//  VanillaSet
//
//  Created by Youngsik Yoon on 5/22/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//
//  Data type for a card
//  Contains a shape, number, shade, and color each of which have their own enumeration

import Foundation

struct SetCard: CustomStringConvertible {
    // Variables holding card properties
    var shape: Shape
    var number: Number
    var shading: Shading
    var color: Color
    
    // Enumeration for the three types of shapes
    enum Shape: String, CustomStringConvertible {
        case triangle = "triangle"
        case square = "square"
        case circle = "circle"
        
        var description: String { return rawValue }
        static var all = [Shape.triangle, .square, .circle]
    }
    
    // Enumeration for the three types of numbers
    enum Number: Int, CustomStringConvertible {
        case one = 1
        case two
        case three
        
        var description: String { return String(rawValue) }
        static var all = [Number.one, .two, .three]
    }
    
    // Enumeration for the three types of shadings
    enum Shading: String, CustomStringConvertible {
        case solid = "solid"
        case stripe = "stripe"
        case empty = "empty"
        
        var description: String { return rawValue }
        static var all = [Shading.solid, .stripe, .empty]
    }
    
    // Enumeration for the three types of colors
    enum Color: String, CustomStringConvertible {
        case red = "red"
        case green = "green"
        case blue = "blue"
        
        var description: String { return rawValue }
        static var all = [Color.red, .green, .blue]
    }
    
    static func ==(lhs: SetCard, rhs: SetCard) -> Bool {
        return lhs.shape == rhs.shape &&
                lhs.number == rhs.number &&
                lhs.shading == rhs.shading &&
                lhs.color == rhs.color
    }
    
    // Description of card for debugging
    var description: String { return "\(number) \(color) \(shading) \(shape)" }
}
