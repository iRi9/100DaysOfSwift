//
//  ViewController.swift
//  Spelling Game
//
//  Created by ebdesk-066 on 18/06/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textFieldsOutletCollection: [UITextField]!
    var textFieldsIndexes:[UITextField:Int] = [:]
    
    enum Direction { case left, right }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0 ..< textFieldsOutletCollection.count {
            textFieldsIndexes[textFieldsOutletCollection[index]] = index
        }
    }

    
    func setNextResponder(_ index:Int?, direction:Direction) {
        
        guard let index = index else { return }
        
        if direction == .left {
            index == 0 ?
                (_ = textFieldsOutletCollection.first?.resignFirstResponder()) :
                (_ = textFieldsOutletCollection[(index - 1)].becomeFirstResponder())
        } else {
            index == textFieldsOutletCollection.count - 1 ?
                (_ = textFieldsOutletCollection.last?.resignFirstResponder()) :
                (_ = textFieldsOutletCollection[(index + 1)].becomeFirstResponder())
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.length == 0 {
            setNextResponder(textFieldsIndexes[textField], direction: .right)
            textField.text = string
            return true
        } else if range.length == 1 {
            setNextResponder(textFieldsIndexes[textField], direction: .left)
            textField.text = ""
            return false
        }
        return false
    }

}

