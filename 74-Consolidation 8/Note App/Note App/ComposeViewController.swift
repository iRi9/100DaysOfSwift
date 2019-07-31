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
    private var isNewNote = false
    private var noteId = ""
    private var noteIndex = 0
    
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        if let index = index {
            if index > -1 {
                let note = noteManager.note(at: index)
                noteId = note.id
                noteIndex = index
                composeTextView.text = note.text
            }
        } else {
            composeTextView.text = ""
            isNewNote = true
        }
        
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
        view.endEditing(true)
    }
    
    @objc func share() {
        var shareNote = ""
        if isNewNote {
            shareNote = composeTextView.text
        } else {
            shareNote = noteManager.note(at: noteIndex).text
        }
        let vc = UIActivityViewController(activityItems: [shareNote], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(vc,animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guard !composeTextView.text.isEmpty else { return }
        
        let note = Note(id: noteId.isEmpty ? UUID.init().uuidString : noteId, text: composeTextView.text)
        
        if isNewNote {
            noteManager.add(note: note, at: 0)
        } else {
            var editedNote = noteManager.notes.filter({$0.id == noteId}).map({ return $0})
            editedNote[0].text = composeTextView.text
            noteManager.edit(note: note, at: noteIndex)
        }

    }

}
