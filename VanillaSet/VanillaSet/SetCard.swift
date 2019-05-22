//
//  SetCard.swift
//  VanillaSet
//
//  Created by Youngsik Yoon on 5/22/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import Foundation

struct SetCard {
    var shape: Shape
    var number: Number
    var shading: Shading
    var color: Color
    
    enum Shape: String {
        case triangle = "triangle"
        case square = "square"
        case circle = "circle"
        
        static var all = [Shape.triangle, .square, .circle]
    }
    
    enum Number: Int {
        case one = 1
        case two
        case three
        
        static var all = [Number.one, .two, .three]
    }
    
    enum Shading: String {
        case solid = "solid"
        case stripe = "stripe"
        case empty = "empty"
        
        static var all = [Shading.solid, .stripe, .empty]
    }
    
    enum Color: String {
        case red = "red"
        case green = "green"
        case blue = "blue"
        
        static var all = [Color.red, .green, .blue]
    }
}
