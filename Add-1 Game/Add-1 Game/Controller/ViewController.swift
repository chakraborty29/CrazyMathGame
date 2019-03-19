//
//  ViewController.swift
//  Add-1 Game
//
//  Created by Student on 1/14/19.
//  Copyright © 2019 Raul Chakraborty. All rights reserved.
//
import UIKit


class ViewController: UIViewController {



    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueCorrectAnswerButton: UIButton!
    @IBOutlet weak var falseWrongAnswerButton: UIButton!
    @IBOutlet weak var falseWrongButton2: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    var score : Int = 0
    var boolAnswer : Bool = false
    var makeQuestionVar : String = ""
    var answerInString : Void
    var falseAnswer1 : Void
    var falseAnswer2: Void
    var timer : Int = 0
    var startTimer = Timer()
    var answerIsCorrectTimerInt : Int = 0
    var answerIsCorrectTimer = Timer()
    var answerIsWrongTimerInt : Int = 0
    let randomAnswerCase = Int.random(in: 0 ... 3)

    
    func scoreSystem() {
        if boolAnswer == true {
            score += 1
        } else if boolAnswer == false {
            score -= 1
            let lossAlert = UIAlertController(title: "STOOPID", message: "I'm Not Gonna Let You Get The Chance! \n Click The Button To Restart :)", preferredStyle: .alert)
            let restartLostAction = UIAlertAction(title: "Restart", style: .destructive) { (UIAlertAction) in
                self.resetGame()
            }
            lossAlert.addAction(restartLostAction)
            present(lossAlert, animated: true, completion: nil)
        }
        scoreLabel.text = String(score)
        
        if score >= 10 {
            startTimer.invalidate()
            answerIsCorrectTimer.invalidate()
            let winAlert = UIAlertController(title: "Congratulation!", message: "Your score is: \(score)! /n You Have Now Won This Game \n Click OK to go back to home page.", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
                self.resetGame()
            }
            winAlert.addAction(restartAction)
            present(winAlert, animated: true, completion: nil)
        }
    }
    
    func additionQuestions() -> (String, Void, Void, Void) {
        var sum : Int = 0
        let firstNumberGen = Int.random(in: 0 ... 100)
        let secondNumberGen = Int.random(in: 0...100)
        questionLabel.text = "\(firstNumberGen) + \(secondNumberGen)"
        makeQuestionVar = questionLabel.text!
        print(makeQuestionVar)
        sum = firstNumberGen + secondNumberGen
        print(sum)
        answerInString = trueCorrectAnswerButton.setTitle( String(sum), for: .normal)
        let randomAnswerCase = Int.random(in: 0 ... 3)
        if sum >= 20 {
            if randomAnswerCase == 0 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(sum + (Int.random(in: 1 ... 10))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(sum + (Int.random(in: 1 ... 10))), for: .normal)
            } else if randomAnswerCase == 1 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(sum - (Int.random(in: 1 ... 10))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(sum - (Int.random(in: 1 ... 10))), for: .normal)
            } else if randomAnswerCase == 2 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(sum + (Int.random(in: 1 ... 10))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(sum - (Int.random(in: 1 ... 10))), for: .normal)
            } else if randomAnswerCase == 3 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(sum - (Int.random(in: 1 ... 10))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(sum + (Int.random(in: 1 ... 10))), for: .normal)
            }
        } else if sum < 20  && sum >= 10 {
            if randomAnswerCase == 0 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(sum + (Int.random(in: 1 ... 5))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(sum + (Int.random(in: 1 ... 5))), for: .normal)
            } else if randomAnswerCase == 1 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(sum - (Int.random(in: 1 ... 5))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(sum - (Int.random(in: 1 ... 5))), for: .normal)
            } else if randomAnswerCase == 2 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(sum + (Int.random(in: 1 ... 5))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(sum - (Int.random(in: 1 ... 5))), for: .normal)
            } else if randomAnswerCase == 3 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(sum - (Int.random(in: 1 ... 5))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(sum + (Int.random(in: 1 ... 5))), for: .normal)
            }
        } else {
            if randomAnswerCase == 0 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(sum + (Int.random(in: 1 ... 2))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(sum + (Int.random(in: 1 ... 2))), for: .normal)
            } else if randomAnswerCase == 1 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(sum - (Int.random(in: 1 ... 2))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(sum - (Int.random(in: 1 ... 2))), for: .normal)
            } else if randomAnswerCase == 2 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(sum + (Int.random(in: 1 ... 2))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(sum - (Int.random(in: 1 ... 2))), for: .normal)
            } else if randomAnswerCase == 3 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(sum - (Int.random(in: 1 ... 2))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(sum + (Int.random(in: 1 ... 2))), for: .normal)
            }
        }
        return (makeQuestionVar, answerInString, falseAnswer1, falseAnswer2)
    }
    
    func subtractionQuestions() -> (String, Void, Void, Void) {
        var subtraction : Int = 0
        let firstNumberGen = Int.random(in: 0 ... 100)
        let secondNumberGen = Int.random(in: 0...100)
        
        if secondNumberGen > firstNumberGen {
            print("\(secondNumberGen) - \(firstNumberGen)")
            questionLabel.text = ("\(secondNumberGen) - \(firstNumberGen)")
             makeQuestionVar = questionLabel.text!
            subtraction = secondNumberGen - firstNumberGen
            print("BS#\(subtraction)")
        } else if firstNumberGen > secondNumberGen {
            print("\(firstNumberGen) - \(secondNumberGen)")
            questionLabel.text = ("\(firstNumberGen) - \(secondNumberGen)")
             makeQuestionVar = questionLabel.text!
            subtraction = firstNumberGen - secondNumberGen
            print("S\(subtraction)")
        } else {
            print("ErrorS1")
        }
        answerInString = trueCorrectAnswerButton.setTitle( String(subtraction), for: .normal)
        let randomAnswerCase = Int.random(in: 0 ... 3)
        if subtraction >= 20 {
            if randomAnswerCase == 0 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(subtraction + (Int.random(in: 1 ... 10))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(subtraction + (Int.random(in: 1 ... 10))), for: .normal)
            } else if randomAnswerCase == 1 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(subtraction - (Int.random(in: 1 ... 10))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(subtraction - (Int.random(in: 1 ... 10))), for: .normal)
            } else if randomAnswerCase == 2 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(subtraction + (Int.random(in: 1 ... 10))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(subtraction - (Int.random(in: 1 ... 10))), for: .normal)
            } else if randomAnswerCase == 3 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(subtraction - (Int.random(in: 1 ... 10))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(subtraction + (Int.random(in: 1 ... 10))), for: .normal)
            }
        } else if subtraction < 20  && subtraction >= 10 {
            if randomAnswerCase == 0 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(subtraction + (Int.random(in: 1 ... 5))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(subtraction + (Int.random(in: 1 ... 5))), for: .normal)
            } else if randomAnswerCase == 1 {
                falseAnswer2 = falseWrongAnswerButton.setTitle(String(subtraction - (Int.random(in: 1 ... 5))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(subtraction - (Int.random(in: 1 ... 5))), for: .normal)
            } else if randomAnswerCase == 2 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(subtraction + (Int.random(in: 1 ... 5))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(subtraction - (Int.random(in: 1 ... 5))), for: .normal)
            } else if randomAnswerCase == 3 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(subtraction - (Int.random(in: 1 ... 5))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(subtraction + (Int.random(in: 1 ... 5))), for: .normal)
            }
        } else {
            if randomAnswerCase == 0 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(subtraction + (Int.random(in: 1 ... 2))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(subtraction + (Int.random(in: 1 ... 2))), for: .normal)
            } else if randomAnswerCase == 1 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(subtraction - (Int.random(in: 1 ... 2))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(subtraction - (Int.random(in: 1 ... 2))), for: .normal)
            } else if randomAnswerCase == 2 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(subtraction + (Int.random(in: 1 ... 2))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(subtraction - (Int.random(in: 1 ... 2))), for: .normal)
            } else if randomAnswerCase == 3 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(subtraction - (Int.random(in: 1 ... 2))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(subtraction + (Int.random(in: 1 ... 2))), for: .normal)
            }
        }
        return (makeQuestionVar, answerInString, falseAnswer1, falseAnswer2)
    }
    
    func multiplicationQuestions() -> (String, Void, Void, Void) {
        var multiplied : Int = 0
        let firstNumberGen = Int.random(in: 0 ... 12)
        let secondNumberGen = Int.random(in: 0...12)
        questionLabel.text = "\(firstNumberGen) * \(secondNumberGen)"
        makeQuestionVar = questionLabel.text!
        print(makeQuestionVar)
        multiplied = firstNumberGen * secondNumberGen
        print(multiplied)
        answerInString = trueCorrectAnswerButton.setTitle( String(multiplied), for: .normal)
        let randomAnswerCase = Int.random(in: 0 ... 3)
        if multiplied >= 20 {
            if randomAnswerCase == 0 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(multiplied + (Int.random(in: 1 ... 10))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(multiplied + (Int.random(in: 1 ... 10))), for: .normal)
            } else if randomAnswerCase == 1 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(multiplied - (Int.random(in: 1 ... 10))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(multiplied - (Int.random(in: 1 ... 10))), for: .normal)
            } else if randomAnswerCase == 2 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(multiplied + (Int.random(in: 1 ... 10))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(multiplied - (Int.random(in: 1 ... 10))), for: .normal)
            } else if randomAnswerCase == 3 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(multiplied - (Int.random(in: 1 ... 10))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(multiplied + (Int.random(in: 1 ... 10))), for: .normal)
            }
        } else if multiplied < 20  && multiplied >= 10 {
            if randomAnswerCase == 0 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(multiplied + (Int.random(in: 1 ... 5))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(multiplied + (Int.random(in: 1 ... 5))), for: .normal)
            } else if randomAnswerCase == 1 {
                falseAnswer2 = falseWrongAnswerButton.setTitle(String(multiplied - (Int.random(in: 1 ... 5))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(multiplied - (Int.random(in: 1 ... 5))), for: .normal)
            } else if randomAnswerCase == 2 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(multiplied + (Int.random(in: 1 ... 5))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(multiplied - (Int.random(in: 1 ... 5))), for: .normal)
            } else if randomAnswerCase == 3 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(multiplied - (Int.random(in: 1 ... 5))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(multiplied + (Int.random(in: 1 ... 5))), for: .normal)
            }
        } else {
            if randomAnswerCase == 0 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(multiplied + (Int.random(in: 1 ... 2))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(multiplied + (Int.random(in: 1 ... 2))), for: .normal)
            } else if randomAnswerCase == 1 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(multiplied - (Int.random(in: 1 ... 2))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(multiplied - (Int.random(in: 1 ... 2))), for: .normal)
            } else if randomAnswerCase == 2 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(multiplied + (Int.random(in: 1 ... 2))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(multiplied - (Int.random(in: 1 ... 2))), for: .normal)
            } else if randomAnswerCase == 3 {
                falseAnswer1 = falseWrongAnswerButton.setTitle(String(multiplied - (Int.random(in: 1 ... 2))), for: .normal)
                falseAnswer2 = falseWrongButton2.setTitle(String(multiplied + (Int.random(in: 1 ... 2))), for: .normal)
            }
        }
        return (makeQuestionVar, answerInString, falseAnswer1, falseAnswer2)
    }
    
    func randomButton() {
        let buttonLocationArray : [Double] = [59.0, 187.0, 316.0]
        let randomXTrue = Int.random(in: 0 ... 2)
        let randomXFlase = Int.random(in: 1 ... 2)
        let randomXFlase2arr = [0, 2]
        let randomXFalse2arrRandom = Int.random(in: 0 ... 1)
        let randomXFalse3Random = Int.random(in: 0 ... 1)
        trueCorrectAnswerButton.center = CGPoint(x: buttonLocationArray[randomXTrue], y: 428.5)
        if randomXTrue == 0 {
            falseWrongAnswerButton.center = CGPoint(x: buttonLocationArray[randomXFlase], y: 428.5)
            if randomXFlase == 1 {
                falseWrongButton2.center = CGPoint(x: 316.0, y: 428.5)
            } else if randomXFlase == 2{
                falseWrongButton2.center = CGPoint(x: 187.0, y: 428.5)
            }
        } else if randomXTrue == 1 {
            falseWrongAnswerButton.center = CGPoint(x: buttonLocationArray[randomXFlase2arr[randomXFalse2arrRandom]], y: 428.5)
            if randomXFalse2arrRandom == 0 {
                falseWrongButton2.center = CGPoint(x: 316.0, y: 428.5)
            } else if randomXFalse2arrRandom == 1 {
                falseWrongButton2.center = CGPoint(x: 59.0, y: 428.5)
            }
        } else if randomXTrue == 2 {
            falseWrongAnswerButton.center = CGPoint(x: buttonLocationArray[randomXFalse3Random], y: 428.5)
            if randomXFalse3Random == 0 {
                falseWrongButton2.center = CGPoint(x: 187.0, y: 428.5)
            } else if randomXFalse3Random == 1 {
                falseWrongButton2.center = CGPoint(x: 59.0, y: 428.5)
            }
        }
    }
    
    func randomQuestions() {
        let mathCase = Int.random(in: 0 ... 2)
        if mathCase == 0 {
            additionQuestions()
        } else if mathCase == 1 {
            subtractionQuestions()
        } else if mathCase == 2 {
            multiplicationQuestions()
        }
    }
    
    func resetGame() {

        randomButton()
        randomQuestions()
        score = 0
        scoreLabel.text = String(score)
        timer = 11
        startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(onTimerFires), userInfo: nil , repeats: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
    }

    @IBAction func theAnswerButton(_ sender: UIButton) {
        answerIsCorrectTimerInt = 11
        randomButton()
        randomQuestions()
        if sender.tag == 1 {
            boolAnswer = true
            startTimer.invalidate()
            answerIsCorrectTimer.invalidate()
            answerIsCorrectTimerInt = 11
            answerIsCorrectTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(correctAnswerTimerFunc), userInfo: nil , repeats: true)
            scoreSystem()
            trueCorrectAnswerButton.titleLabel?.textColor = UIColor.green
            falseWrongAnswerButton.titleLabel?.textColor = UIColor.green
            falseWrongButton2.titleLabel?.textColor = UIColor.green
        } else if sender.tag == 2 {
            boolAnswer = false
            startTimer.invalidate()
            answerIsCorrectTimer.invalidate()
            scoreSystem()
            trueCorrectAnswerButton.titleLabel?.textColor = UIColor.red
            falseWrongAnswerButton.titleLabel?.textColor = UIColor.red
            falseWrongButton2.titleLabel?.textColor = UIColor.red
        } else if sender.tag == 3 {
            boolAnswer = false
            startTimer.invalidate()
            answerIsCorrectTimer.invalidate()
            scoreSystem()
            trueCorrectAnswerButton.titleLabel?.textColor = UIColor.red
            falseWrongAnswerButton.titleLabel?.textColor = UIColor.red
            falseWrongButton2.titleLabel?.textColor = UIColor.red
        }
    }
    
    @IBAction func test(_ sender: UIButton) {
        randomButton()
        randomQuestions()
        score = 0
    }
    
    
    @objc func onTimerFires() {
        timer = timer - 1
        timerLabel.text = String(timer)
        
        if timer == 0 {
            startTimer.invalidate()
            boolAnswer = false
            scoreSystem()
        }
    }
    
    @objc func correctAnswerTimerFunc() {
        answerIsCorrectTimerInt -= 1
        timerLabel.text = String(answerIsCorrectTimerInt)
        if answerIsCorrectTimerInt == 0 {
            answerIsCorrectTimer.invalidate()
            boolAnswer = false
            scoreSystem()
        }
    }
    
    }
    


    






