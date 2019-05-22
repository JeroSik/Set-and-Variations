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
    
    enum Shape {
        case triangle
        case square
        case circle
    }
    
    enum Number: Int {
        case one
        case two
        case three
    }
    
    enum Shading {
        case solid
        case stripe
        case empty
    }
    
    enum Color {
        case red
        case green
        case blue
    }
}
