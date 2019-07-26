//
//  ComposeViewController.swift
//  Note App
//
//  Created by ebdesk-066 on 25/07/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet var composeTextView: UITextView!
    
    var note: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false

        guard let composeNote = note else { return }
        composeTextView.text = composeNote
    }

}
