//
//  ViewController.swift
//  quizie
//
//  Created by Mrityunjay Kumar on 27/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!

    var quizBrain: QuizBrain = QuizBrain()
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Loading first question whenever user opens app
        questionLabel.text = quizBrain.getNextQuestion()
        statusLabel.text = "\(quizBrain.questionNumber + 1) / \(quizBrain.questions.count) ------ Score : \(quizBrain.userScore) / \(quizBrain.questions.count)"
        progressBar.progress = Float(quizBrain.questionNumber + 1) / Float(quizBrain.questions.count)
        
        
        populateOptions()
    }

    @IBAction func responseButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        
        let buttonType = sender.titleLabel?.text! ?? ""
        
        print("buttonType : ", buttonType)
        
        let isCorrectAnswer = quizBrain.checkAnswer(userAnswer: buttonType)
        
        if isCorrectAnswer {
            print("user got it right!")
            sender.backgroundColor = UIColor.green
            
            quizBrain.userScore += 1
            
        } else {
            print("user got it wrong.")
            sender.backgroundColor = UIColor.red
        }
        
        // updating question here after 0.3 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(changeQuestion), userInfo: nil, repeats: false)
        
}
    
    @objc func changeQuestion () {

        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
        
        quizBrain.questionNumber += 1;
        
        if quizBrain.questionNumber == quizBrain.questions.count {
            quizBrain.questionNumber = 0;
            quizBrain.userScore = 0
        }
        
        let question: String = quizBrain.getNextQuestion()
        questionLabel.text = question
        
        populateOptions()
        
        statusLabel.text = "\(quizBrain.questionNumber + 1) / \(quizBrain.questions.count)------ Score : \(quizBrain.userScore) / \(quizBrain.questions.count)"

        let progress: Float = quizBrain.getProgress()
//        print(progress)
        progressBar.progress = progress;
    }
    
    func populateOptions () {
        
        let options: [String] = quizBrain.getOptions();
        
//        print("options = \(options). count = \(options.count)")
        
        if (options.count == 2) {
            
            firstButton.setTitle(options[0], for: .normal)
            secondButton.setTitle(options[1], for: .normal)
            thirdButton.isHidden = true;
            
        } else if options.count == 3 {
            thirdButton.isHidden = false;

            firstButton.setTitle(options[0], for: .normal)
            secondButton.setTitle(options[1], for: .normal)
            thirdButton.setTitle(options[2], for: .normal)
            
        }

    }
    
}
