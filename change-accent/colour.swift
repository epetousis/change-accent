//
//  colour.swift
//  change-accent
//
//  Created by Evangelos Petousis on 17/8/19.
//  Copyright © 2019 Evangelos Petousis. All rights reserved.
//

import Foundation

func hexPortion(_ string: String, _ lower: Int, _ upper: Int) -> UInt8? {
    let lowerBound = string.index(string.startIndex, offsetBy: lower)
    let upperBound = string.index(string.startIndex, offsetBy: upper)
    let str = String(string[lowerBound...upperBound])
    return UInt8(str, radix: 16)
}

func hexTuple(hex: String) -> (Double, Double, Double) {
    if let red = hexPortion(hex, 1, 2),
        let green = hexPortion(hex, 3, 4),
        let blue = hexPortion(hex, 5, 6) {
        return (Double(red), Double(green), Double(blue))
    }
    return (0, 0, 0)
}

func colourDifference(color1: String, color2: String) -> Double {
    let ct1 = hexTuple(hex: color1)
    let ct2 = hexTuple(hex: color2)
    
    let redDifSq = pow((ct2.0 - ct1.0), 2.0)
    let greenDifSq = pow((ct2.1 - ct1.1), 2.0)
    let blueDifSq = pow((ct2.2 - ct1.2), 2.0)
    let sumOfDifferences = redDifSq + greenDifSq + blueDifSq
    return sqrt(abs(sumOfDifferences))
}
