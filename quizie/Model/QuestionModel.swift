//
//  QuestionModel.swift
//  quizie
//
//  Created by Mrityunjay Kumar on 27/07/23.
//

import Foundation

struct Question {
    var question: String
    var options: [String]
    var answer: String

    init (q: String, options: [String], a: String) {
        self.question = q
        self.options = options
        self.answer = a
    }
}
