//
//  checkAnswer.swift
//  Add-1 Game
//
//  Created by Raul Chakraborty on 2/14/19.
//  Copyright © 2019 Raul Chakraborty. All rights reserved.
//

import Foundation
class CheckAnswer {
    var timer : Int
    
    init() {
        timer = 21
        for i in stride(from: 20, through: 0, by: -1) {
            timer = timer - 1
            print(timer)
            sleep(1)
        }
    }
}
