//
//  ViewController.swift
//  Rabble Wabble
//
//  Created by Matheus Vaccaro on 04/03/24.
//

import UIKit

// MARK: - QuestionViewController

class QuestionViewController: UIViewController {

    // MARK: Properties
    
    var questionGroup = QuestionGroup.basicPhrases()
    var questionIndex = 0
    
    var correctCount = 0
    var incorrectCount = 0
    
    var questionView: QuestionView! {
        guard isViewLoaded else {
            return nil
        }
        
        return (view as! QuestionView)
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    
    // MARK: Actions
    
    @IBAction func toggleAnswerLabels(_ sender: Any) {
        questionView.answerLabel.isHidden.toggle()
        questionView.hintLabel.isHidden.toggle()
    }
    
    @IBAction func handleCorrect(_ sender: Any) {
        correctCount += 1
        questionView.correctCountLabel.text = "\(correctCount)"
        
        showNextQuestion()
    }
    
    @IBAction func handleIncorrect(_ sender: Any) {
        incorrectCount += 1
        questionView.incorrectCountLabel.text = "\(incorrectCount)"
        
        showNextQuestion()
    }
    
    // MARK: Private
    
    private func showQuestion() {
        let question = questionGroup.questions[questionIndex]
        
        questionView.answerLabel.text = question.answer
        questionView.promptLabel.text = question.prompt
        questionView.hintLabel.text = question.hint
        
        questionView.answerLabel.isHidden = true
        questionView.hintLabel.isHidden = true
    }
    
    private func showNextQuestion() {
        questionIndex += 1
        
        guard questionIndex < questionGroup.questions.count else {
            // TODO: Handle this.
            return
        }
        
        showQuestion()
    }

}
