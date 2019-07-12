//
//  QuizController.swift
//  FRIENDS Quiz
//
//  Created by GWC on 7/10/19.
//  Copyright © 2019 Rebecca. All rights reserved.
//

import UIKit

struct Question
    {var title: String
    var answers: [String]
    var correctAnswer: Int}

class QuizController: UIViewController {

@IBOutlet weak var questionLabel: UITextView!
@IBOutlet weak var progressLabel: UITextView!
    
@IBOutlet weak var answer0: UIButton!
@IBOutlet weak var answer1: UIButton!
@IBOutlet weak var answer2: UIButton!
@IBOutlet weak var answer3: UIButton!
    
let questions: [Question] =
[Question(title: "What is Janice's catchphrase?", answers: ["EXCUSE ME", "OH MY GOSH", "OH MY GOD", "I CAN'T EVEN"], correctAnswer: 2),
Question(title: "What happened at Ross's second wedding?", answers: ["She was a lesbian", "He said the wrong name", "They were drunk", "Somone interrupted"], correctAnswer: 1),
Question(title: "Who did Ross's first wife leave him for?", answers: ["Carol", "Susan", "Julie", "Emily"], correctAnswer: 1),
Question(title: "What Cafe did the characters hang out in?", answers: ["Central Park", "Central Perk", "Centrel Park", "Centrel Perk"], correctAnswer: 1),
Question(title: "How many main characters are there?", answers: ["Two", "Five", "Six", "Eight"], correctAnswer: 2),
Question(title: "Who did Gunther like?", answers: ["Monica", "Janice", "Emily", "Rachel"], correctAnswer: 3),
Question(title: "What was the name of the soap opera that Joey starred on?", answers: ["Days in Our Life", "Days on Our Lives", "Days of Our Lives", "Days in Our Lives"], correctAnswer: 2),
Question(title: "What color is the couch that the friends sit on at Central Perk?", answers: ["Brown", "Salmon", "Red", "Orange"], correctAnswer: 3),
Question(title: "Which animal was not a pet on Friends?", answers: ["Micro-Pig", "Rat", "Hairless Cat", "Capuchin Monkey"], correctAnswer: 0),]
    
var currentQuestion: Question?
var currentIndex: Int = 0
    
override func viewDidLoad() {
    super.viewDidLoad()

        setQuestion()
}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            let controller =
            segue.destination as!
            ResultsController
            controller.numberCorrect = correctAnswers
            controller.total = questions.count
    }}
    
    
func setQuestion(){
    if currentIndex < questions.count
        {currentQuestion = questions[currentIndex]
        questionLabel.text = currentQuestion?.title
        answer0.setTitle(currentQuestion?.answers[0], for: .normal)
        answer1.setTitle(currentQuestion?.answers[1], for: .normal)
        answer2.setTitle(currentQuestion?.answers[2], for: .normal)
        answer3.setTitle(currentQuestion?.answers[3], for: .normal)
        progressLabel.text = "\(currentIndex+1)/\(questions.count)"
    } else {
        performSegue(withIdentifier: "showResults", sender: self)
    }}

    func nextQuestion(){
        currentIndex += 1
        setQuestion()
    }
    
    var correctAnswers: Int = 0
    
    func checkAnswer(index: Int) {
        if currentQuestion?.correctAnswer == index {
            correctAnswers += 1
        }
        nextQuestion()
    }
    
@IBAction func answer0(_ sender: Any)
    {checkAnswer(index: 0)}
    
@IBAction func answer1(_ sender: Any)
    {checkAnswer(index: 1)}
    
@IBAction func answer2(_ sender: Any)
    {checkAnswer(index: 2)}
    
@IBAction func answer3(_ sender: Any)
    {checkAnswer(index: 3)}}
