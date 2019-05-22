//
//  SetCard.swift
//  VanillaSet
//
//  Created by Youngsik Yoon on 5/22/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import Foundation

struct SetCard: CustomStringConvertible {
    var shape: Shape
    var number: Number
    var shading: Shading
    var color: Color
    
    var description: String { return "\(number) \(color) \(shading) \(shape)" }
    
    enum Shape: String, CustomStringConvertible {
        case triangle = "triangle"
        case square = "square"
        case circle = "circle"
        
        var description: String { return rawValue }
        static var all = [Shape.triangle, .square, .circle]
    }
    
    enum Number: Int, CustomStringConvertible {
        case one = 1
        case two
        case three
        
        var description: String { return String(rawValue) }
        static var all = [Number.one, .two, .three]
    }
    
    enum Shading: String, CustomStringConvertible {
        case solid = "solid"
        case stripe = "stripe"
        case empty = "empty"
        
        var description: String { return rawValue }
        static var all = [Shading.solid, .stripe, .empty]
    }
    
    enum Color: String, CustomStringConvertible {
        case red = "red"
        case green = "green"
        case blue = "blue"
        
        var description: String { return rawValue }
        static var all = [Color.red, .green, .blue]
    }
}
