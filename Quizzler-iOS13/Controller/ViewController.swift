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
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: BooleanButton!
    @IBOutlet weak var falseButton: BooleanButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        trueButton.value = true
        falseButton.value = false
    }
    
    func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
    }
    
    func highlightAnswer(correctAnswer: Bool, button: UIButton){
        if correctAnswer {
            button.backgroundColor = UIColor.green
        } else {
            button.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(clearAnswer), userInfo: nil, repeats: false)
    }
    
    @IBAction func buttonTapped(_ sender: BooleanButton) {
        highlightAnswer(correctAnswer: quizBrain.validateAnswer(from: sender), button: sender)
        quizBrain.increaseQuestionNumber()
        updateUI()
    }
    
    @objc func clearAnswer(){
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

