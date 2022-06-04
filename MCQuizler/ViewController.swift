//
//  ViewController.swift
//  MCQuizler
//
//  Created by Abdul Basit on 30/01/2020.
//  Copyright © 2020 RommanApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    let quiz: [Question] = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAsnwer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAsnwer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAsnwer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAsnwer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAsnwer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAsnwer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAsnwer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAsnwer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAsnwer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAsnwer: "Australia")
    ]
    
    var questionNumber = 0
    var scoreCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
      let userAnswer = sender.currentTitle
          let actualAnswer = quiz[questionNumber].answer
          
          if userAnswer == actualAnswer{
              
              sender.backgroundColor = UIColor.green
              scoreCount += 1
            
          }
          else{
              sender.backgroundColor = UIColor.red
             
          }
          
          if questionNumber < quiz.count - 1 {
          questionNumber += 1
          
          
          }
          else{
              questionNumber = 0
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (_) in
                  // TODO: - whatever you want
            self.scoreLabel.text = "Your total Score was:  \(self.scoreCount)"
            self.scoreCount = 0
              }
            }
              
          updateUI()
      }
    
    
    func updateUI(){
        
        questionLabel.text = quiz[questionNumber].text
        option1.setTitle(quiz[questionNumber].options[0], for: .normal)
        option2.setTitle(quiz[questionNumber].options[1], for: .normal)
        option3.setTitle(quiz[questionNumber].options[2], for: .normal)
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (_) in
                    // TODO: - whatever you want
                  self.option1.backgroundColor = UIColor.clear
                  self.option2.backgroundColor = UIColor.clear
                  self.option3.backgroundColor = UIColor.clear
                  
                  self.progressBar.progress = Float(self.questionNumber + 1) / Float(self.quiz.count)
                 }
        scoreLabel.text = "Score : \(scoreCount)"
    }
    
}

