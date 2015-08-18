// Int.swift
//
// Copyright (c) 2014–2015 Apostle (http://apostle.nl)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

public extension Int {
    /**
        Return a random number between `min` and `max`.

        - note: The maximum value cannot be more than `UInt32.max - 1`
        
        - parameter min: The minimum value of the random value (defaults to `0`).
        - parameter max: The maximum value of the random value (defaults to `UInt32.max - 1`)
    
        - returns: Returns a random value between `min` and `max`.
    */
    public static func random(min : Int = 0, max : Int = Int(UInt32.max - 1)) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    /**
        Return a random number with exactly `digits` digits.
        
        - parameter digits: The number of digits the random number should have.
    
        - returns: Returns a random number with exactly `digits` digits.
    */
    public static func number(digits : Int? = nil) -> Int {
        let nbDigits = digits != nil ? digits! : Int.random(1, max: 9)
        let maximum  = pow(10, Double(nbDigits)) - 1
        let result   = Int.random(Int(pow(10, Double(nbDigits - 1))), max: Int(maximum))
        
        return result
    }
    
    public func randomize(variation : Int) -> Int {
        let multiplier = Double(Int.random(100 - variation, max: 100 + variation)) / 100
        let randomized = Double(self) * multiplier
        
        return Int(randomized) + 1
    }
}