//
//  ViewController.swift
//  WhichProgrammingLang
//
//  Created by Emily Roach on 5/29/18.
//  Copyright © 2018 Emily Roach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    
    //Make the questions struct
    struct Question {
        let question: String
        let answers: [String]
        let jsAnswer: Int
        let swiftAnswer: Int
        let scratchAnswer: Int
        let htmlAnswer: Int
    }
    
    //Store the info for my questions
    var questions: [Question] = [
        Question(
            question: "When you aren't coding, what do you like to do?",
            answers: ["Play video games", "Try out new apps", "Play games from \nmy childhood", "Surf the web"],
            jsAnswer: 0,
            swiftAnswer: 1,
            scratchAnswer: 2,
            htmlAnswer: 3
        ),
        Question(
            question: "What is your favorite class in school?",
            answers: ["PE", "Language Arts", "Art", "Math"],
            jsAnswer: 3,
            swiftAnswer: 1,
            scratchAnswer: 0,
            htmlAnswer: 2
        ),
        Question(
            question: "What do you want to learn to code next?",
            answers: ["The next viral video game", "A cute animation", "A fan page \n for my favorite celebrity", "The next big social\n networking app"],
            jsAnswer: 0,
            swiftAnswer: 3,
            scratchAnswer: 1,
            htmlAnswer: 2
        )
    ]
    
    //The question I'm asking
    var currentQuestion: Question?
    
    //The number of the question I'm asking
    var currentQuestionPosition: Int = 0
    
    //Keeping track of score for each
    var numJs: Int = 0;
    var numSwift: Int = 0;
    var numScratch: Int = 0;
    var numHtml: Int = 0;
    
    //Set up each question
    func setQuestion() {
        questionLabel.text = currentQuestion!.question
        answer0.setTitle("> " + currentQuestion!.answers[0], for: .normal)
        answer1.setTitle("> " + currentQuestion!.answers[1], for: .normal)
        answer2.setTitle("> " + currentQuestion!.answers[2], for: .normal)
        answer3.setTitle("> " + currentQuestion!.answers[3], for: .normal)
        progressLabel.text = "Question: \(currentQuestionPosition + 1)/ \(questions.count)"
    }
    
    //Get the next question
    func loadNextQuestion(){
        
        //If I haven't reached the end
        if(currentQuestionPosition + 1 < questions.count) {
            
            //Update the variables to the values stored in the next position of the questions struct
            currentQuestionPosition += 1
            currentQuestion = questions[currentQuestionPosition]
            
        } else {
            
            //Show the results screen
            performSegue(withIdentifier: "sgShowResults", sender: nil)
        }
        setQuestion()
    }
    
    //Add a point to the language that corresponds to the user's answer
    func tallyAnswer(idx: Int){
        if(idx == currentQuestion!.jsAnswer){
            numJs += 1
        } else if (idx == currentQuestion!.swiftAnswer){
            numSwift += 1
        } else if (idx == currentQuestion!.scratchAnswer){
            numScratch += 1
        } else {
            numHtml += 1
        }
        loadNextQuestion()
    }
    
    //Send info over segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgShowResults") {
            let vc = segue.destination as! ResultsViewController
            vc.numJs = numJs
            vc.numSwift = numSwift
            vc.numScratch = numScratch
            vc.numHtml = numHtml
        }
    }
    
    //Button clicked events
    @IBAction func submitAnswer0(_ sender: Any) {
        tallyAnswer(idx: 0)
    }
    
    @IBAction func submitAnswer1(_ sender: Any) {
        tallyAnswer(idx: 1)
    }
    
    @IBAction func submitAnswer2(_ sender: Any) {
        tallyAnswer(idx: 2)
    }
    
    @IBAction func submitAnswer3(_ sender: Any) {
        tallyAnswer(idx: 3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestion = questions[0]
        setQuestion()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

