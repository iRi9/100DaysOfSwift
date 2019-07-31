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
    
    private var noteManager = NoteManager()
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        guard let index = index else { return }
        
//        if noteManager.note(at: index) {
//            let note = noteManager.note(at: index)
//            composeTextView.text = note.text
//        } else {
            composeTextView.text = ""
//        }
        
        let doneBarItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        let shareBarItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
        navigationItem.rightBarButtonItems = [doneBarItem, shareBarItem]
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            composeTextView.contentInset = .zero
        } else {
            composeTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom
                , right: 0)
        }
        
        composeTextView.scrollIndicatorInsets = composeTextView.contentInset
        
        let selectRange = composeTextView.selectedRange
        composeTextView.scrollRangeToVisible(selectRange)
        
    }
    
    @objc func done() {
        
    }
    
    @objc func share() {
        
    }

}
