//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Maximiliano París Gaete on 3/22/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: Bool
    
    init(text: String, answer: Bool) {
        self.text = text
        self.answer = answer
    }
}
