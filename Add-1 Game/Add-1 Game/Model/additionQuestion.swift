//
//  additionQuestion.swift
//  Add-1 Game
//
//  Created by Raul Chakraborty on 2/13/19.
//  Copyright © 2019 Raul Chakraborty. All rights reserved.
//

import Foundation
class AdditionQuestion {
    var questionOnScreen : String
    var answer : Int
    init() {
        let firsNumberGen = Int.random(in: 0 ... 10)
        let secondNumberGen = Int.random(in: 0 ... 10)
        questionOnScreen = ("\(firsNumberGen) + \(secondNumberGen)")
        print(questionOnScreen)
        answer = firsNumberGen + secondNumberGen
        print(answer)
    }
}
