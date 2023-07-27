//
//  QuizBrain.swift
//  quizie
//
//  Created by Mrityunjay Kumar on 27/07/23.
//

import Foundation

struct QuizBrain {

    let questions = [
        Question(q: "A slug's blood is green.", options: [ "True", "False"], a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", options: [ "True", "False"], a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", options: [ "True", "False"], a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", options: [ "True", "False"], a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", options: [ "True", "False"], a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", options: [ "True", "False"], a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", options: [ "True", "False"], a: "False"),
        Question(q: "Google was originally called 'Backrub'.", options: [ "True", "False"], a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", options: [ "True", "False"], a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", options: [ "True", "False"], a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", options: [ "True", "False"], a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", options: [ "True", "False"], a: "True"),
                      
        Question(q: "Which is the largest organ in the human body?", options: ["Heart", "Skin", "Large Intestine"], a: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", options: ["25", "50", "100"], a: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", options: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], a: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", options: ["Chapeau", "Écharpe", "Bonnet"], a: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", options: ["Notebook", "Handkerchief", "Watch"], a: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", options: ["Au Revoir", "Adiós", "Salir"], a: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", options: ["Green", "Orange", "Blue"], a: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", options: ["Rum", "Whisky", "Gin"], a: "Rum"),
        Question(q: "What type of animal was Harambe?", options: ["Panda", "Gorilla", "Crocodile"], a: "Gorilla"),
        Question(q: "Where is Tasmania located?", options: ["Indonesia", "Australia", "Scotland"], a: "Australia")

    ]

    var questionNumber = 0
    var userScore = 0
    
    func getNextQuestion () -> String {
        return questions[questionNumber].question
    }

    func checkAnswer (userAnswer: String) -> Bool {
        
        if questions[questionNumber].answer == userAnswer {
            return true
        }
        
        return false
    }
    
    func getProgress () -> Float {
        return Float(questionNumber + 1) / Float(questions.count)
    }
    
    func getOptions () -> [String] {
        return questions[questionNumber].options
    }

}
