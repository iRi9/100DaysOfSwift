//
//  ViewController.swift
//  Note App
//
//  Created by ebdesk-066 on 24/07/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var noteManager = NoteManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("did load")
        
        title = "Note"
        navigationController?.navigationBar.prefersLargeTitles = true
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let compose = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(composeNote))
        
        toolbarItems = [spacer, compose]
        navigationController?.isToolbarHidden = false
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteManager.notesCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let note = noteManager.note(at: indexPath.row)
        cell.textLabel?.text = note.text
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showComposeVC(indexPath.row)
        
    }
    
    @objc func composeNote() {
        showComposeVC(nil)
    }
    
    func showComposeVC(_ index: Int?) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Compose") as? ComposeViewController {
            vc.index = index
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

