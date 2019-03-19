//
//  makeQuestion.swift
//  Add-1 Game
//
//  Created by Raul Chakraborty on 2/13/19.
//  Copyright © 2019 Raul Chakraborty. All rights reserved.
//

import Foundation
class MakeQuestion {
    
    let mathCase = Int.random(in: 0...2)
    var mathCaseArray : [Int] = []
    let firstNumberGen = Int.random(in: 0...10)
    let secondNumberGen = Int.random(in: 0...10)
    let firstNumberGenM = Int.random(in: 0 ... 5)
    let secondNumberGenM = Int.random(in: 0 ... 5)
    var questionFromMathCase : String?
    var answer : Int?
    
    
    
    init() {
        
    if mathCase == 0 {
    print("\(firstNumberGen) + \(secondNumberGen)")
    questionFromMathCase = "\(firstNumberGen) + \(secondNumberGen)"
    answer = firstNumberGen + secondNumberGen
    print("A\(answer)")
        
    } else if mathCase == 1{
    if secondNumberGen > firstNumberGen {
    print("\(secondNumberGen) - \(firstNumberGen)")
    questionFromMathCase = "\(secondNumberGen) - \(firstNumberGen)"
    answer = secondNumberGen - firstNumberGen
    print("BS#\(answer)")
    } else if firstNumberGen > secondNumberGen {
    print("\(firstNumberGen) - \(secondNumberGen)")
    questionFromMathCase = "\(firstNumberGen) - \(secondNumberGen)"
    answer = firstNumberGen - secondNumberGen
    print("S\(answer)")
    } else {
    print("ErrorS1")
    }
        
    } else if mathCase == 2 {
    print("\(firstNumberGenM) x \(secondNumberGenM)")
    questionFromMathCase = "\(firstNumberGenM) x \(secondNumberGenM)"
    answer = firstNumberGenM * secondNumberGenM
    print("M\(answer)")
    } else {
    print("ErrorO")
    }
    }
}
