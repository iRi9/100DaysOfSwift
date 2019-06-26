//
//  ViewController.swift
//  Project2
//
//  Created by ebdesk-066 on 16/05/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var highestScoreLabel: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var totalQuestion = 0
    
    var highScore: Int = 0 {
        didSet {
            self.highestScoreLabel.text = "High Score : \(highScore)"
        }
    }
    
    let defaults = UserDefaults.standard
    let key = "HIGHEST_SCORE"
    var isBeatedHighestScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareMyScore))
        
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
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        highScore = defaults.integer(forKey: key)
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        if totalQuestion == 10 {
            let ac = UIAlertController(title: "WOW", message: "You have answer 10 questions", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            ac.addAction(action)
            
            present(ac, animated: true)
        }
        
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        
        title = "\(countries[correctAnswer].uppercased()) Score \(score)"
        
        totalQuestion += 1
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            saveHighestScore(score)
        } else {
            title = "Wrong"
            score -= 1
        }
        
        if isBeatedHighestScore == 1 {
            let ac = UIAlertController(title: "Yuhuuu", message: "You beated the highest score", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: askQuestion)
            ac.addAction(action)
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac,animated: true)
        }
    }
    
    @objc func shareMyScore() {
        let vc = UIActivityViewController(activityItems: ["My score \(score) in Guess The Flag App 😎"], applicationActivities: [])
        
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(vc,animated: true)
    }
    
    func saveHighestScore(_ score: Int) {
        if score > defaults.integer(forKey: key) {
            isBeatedHighestScore += 1
            defaults.set(score, forKey: key)
            highScore = score
        }
        
    }
    

}

