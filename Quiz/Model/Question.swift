//
//  Question.swift
//  Quiz
//
//  Created by Yaroslav Yanchak on 7/11/22.
//

import Foundation

struct Question {
    let  text: String
    let answer: [String]
    let correctAnswer: String
    init(q: String, a: [String], ca:String) {
    text = q
    answer = a
    correctAnswer = ca
        }
}
