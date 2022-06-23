//
//  Question.swift
//  Quiz
//
//  Created by JiaChen(: on 1/6/21.
//

import Foundation

enum CorrectOptions {
    case one, two, three, four
}

struct Question {
    var title: String
    
    var option1: String
    var option2: String
    var option3: String
    var option4: String
    
    var correctOption: CorrectOptions
}
