//
//  ViewController.swift
//  Quiz
//
//  Created by Yaroslav Yanchak on 6/5/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var Answer0: UIButton!
    @IBOutlet weak var Answer1: UIButton!
    @IBOutlet weak var Answer2: UIButton!
    
    var quizBrain = QuizBrain()
           
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        updateUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func pressedButton(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
 
        let userGotItRight = quizBrain.checkAnswer(userAnswer)

        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red      }
      
        quizBrain.getNextQuestion()
        
        DispatchQueue.main.asyncAfter(deadline:.now() + 0.2) {
            self.updateUI()}
        }
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        Answer0.setTitle(quizBrain.getAnswer(0), for: .normal)
        Answer1.setTitle(quizBrain.getAnswer(1), for: .normal)
        Answer2.setTitle(quizBrain.getAnswer(2), for: .normal)
        Answer0.backgroundColor = UIColor.clear
        Answer1.backgroundColor = UIColor.clear
        Answer2.backgroundColor = UIColor.clear
        scoreLabel.text = quizBrain.getScore()
    }
}


