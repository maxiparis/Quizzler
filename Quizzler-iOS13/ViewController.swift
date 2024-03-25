//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.

//  Updated by Max Paris on 3/22/2024
//

import UIKit

class ViewController: UIViewController {
    
    let quiz = [Question(text: "A slug's blood is green.", answer: true),
                Question(text: "Approximately one quarter of human bones are in the feet.", answer: true),
                Question(text: "The total surface area of two human lungs is approximately 70 square metres.", answer: true),
                Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: true),
                Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: false),
                Question(text: "It is illegal to pee in the Ocean in Portugal.", answer: true),
                Question(text: "You can lead a cow down stairs but not up stairs.", answer: false),
                Question(text: "Google was originally called 'Backrub'.", answer: true),
                Question(text: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: true),
                Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: false),
                Question(text: "No piece of square dry paper can be folded in half more than 7 times.", answer: false),
                Question(text: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: true)]
    
    var questionNumber = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: BooleanButton!
    @IBOutlet weak var falseButton: BooleanButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        trueButton.value = true
        falseButton.value = false
    }
    
    func updateUI(){
        questionLabel.text = quiz[questionNumber].text
        let percentageBar = Float( Float(questionNumber) / Float(quiz.count) )
        progressBar.progress = percentageBar
    }
    
    func updateQuestionNumber(){
        if (questionNumber == quiz.count-1){
            questionNumber = 0
        } else {
            questionNumber += 1
        }
    }
    
    
    func highlightAnswer(correctAnswer: Bool, button: UIButton){
        if correctAnswer {
            button.backgroundColor = UIColor.green
        } else {
            button.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(clearAnswer), userInfo: nil, repeats: false)
    }
    
    func validateAnswer(from sender: BooleanButton) -> Bool {
        return quiz[questionNumber].answer == sender.value
    }
    
    @IBAction func buttonTapped(_ sender: BooleanButton) {
        highlightAnswer(correctAnswer: validateAnswer(from: sender), button: sender)
        updateQuestionNumber()
        updateUI()
    }
    
    @objc func clearAnswer(){
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

