//
//  ViewController.swift
//  Project2100Swift
//
//  Created by Field Employee on 8/30/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased() + " - Player's Score: \(score)"
        questionsAsked += 1

    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title:  String
        var message: String?
        
        if sender.tag == correctAnswer {
            title = "Correct!"
            score += 1
        }else {
            title = "Wrong!"
            score -= 1
            message = "Oops ! Sorry, that's actually \(countries[correctAnswer].uppercased())'s Flag \n Your score is \(score)"
            
        }
       if questionsAsked <= 10 {
                       let ac = UIAlertController(title: title, message: message ?? "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        } else {
            let acDone = UIAlertController(title: "Game is Over !", message: "You finished with a final score of \(score)!", preferredStyle: .alert)
            acDone.addAction(UIAlertAction(title: "Done", style: .destructive, handler: askQuestion))
            present(acDone, animated: true)
            questionsAsked = 0
            score = 0
        }
    }
}

