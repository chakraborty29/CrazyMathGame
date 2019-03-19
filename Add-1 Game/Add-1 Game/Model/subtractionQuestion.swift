//
//  subtractionQuestion.swift
//  Add-1 Game
//
//  Created by Raul Chakraborty on 2/13/19.
//  Copyright © 2019 Raul Chakraborty. All rights reserved.
//

import Foundation
class SubtractionQuestion {
    
    let firsNumberGen = Int.random(in: 0 ... 10)
    let secondNumberGen = Int.random(in: 0 ... 10)
    var questionOnScreen : String?
    var answer : Int?
    init() {
        if firsNumberGen > secondNumberGen {
        questionOnScreen = ("\(firsNumberGen) - \(secondNumberGen)")
        answer = firsNumberGen - secondNumberGen
        } else if secondNumberGen > firsNumberGen {
            questionOnScreen = ("\(secondNumberGen) - \(firsNumberGen)")
            answer = secondNumberGen - firsNumberGen
        }
    }
}
