//
//  ViewController.swift
//  Project5
//
//  Created by ebdesk-066 on 24/05/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var allWords = [String]()
    var usedWords = [Words]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(startGame))
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: ".txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
                
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        
        startGame()
        
        let defaults = UserDefaults.standard
        if let savedWord = defaults.object(forKey: "word") as? Data {
            let jsonDecoder = JSONDecoder()
            do {
                self.usedWords = try jsonDecoder.decode([Words].self, from: savedWord)
                print(usedWords)
            } catch {
                print("Failed to load people")
            }
        }
        
        
    }
    
    @objc func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row].word
        return cell
    }
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ answer: String) {
        let lowerAnswer = answer.lowercased()
        
        let errorTitle: String
        let errotMessage: String
        
        if isPossibel(word: lowerAnswer) {
            if isOriginal(word: lowerAnswer) {
                if isReal(word: lowerAnswer) {
                    let word = Words(word: answer)
                    usedWords.insert(word, at: 0)
                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)
                    save()
                    return
                } else {
                    errorTitle = "Word not recognized"
                    errotMessage = "You can't just make them up, you know!"
                }
            } else {
                errorTitle = "Word alredy used"
                errotMessage = "Be more original"
            }
        } else {
            errorTitle = "Word not possible"
            errotMessage = "You can't spell that word from \(title!.lowercased())"
        }
        
        showMessage(errorTitle: errorTitle, errorMessage: errotMessage)
    }
    
    func isPossibel(word: String) -> Bool {
        guard var tempWord = title?.lowercased() else {
            return false
        }
        
        for letter in word {
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        for (_,value) in usedWords.enumerated() {
            if value.word.contains(word) {
                return false
            }
        }
        return true
//        return !usedWords.contains(word)
    }
    
    func isReal(word: String) -> Bool {
        if word.utf16.count < 3 {
            return false
        }
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspellRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspellRange.location == NSNotFound
    }
    
    func showMessage(errorTitle: String, errorMessage: String) {
        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac,animated: true)
    }
    
    func save() {
        print("save function usedWords = \(usedWords)")
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(usedWords) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "word")
        } else {
            print("Failed to save people.")
        }
    }

}

