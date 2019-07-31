//
//  ViewController.swift
//  Note App
//
//  Created by ebdesk-066 on 24/07/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UISearchResultsUpdating {
    
    var noteManager = NoteManager()
    var searchController = UISearchController()
    var filteredData = [Note]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Note"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let compose = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(composeNote))

        toolbarItems = [spacer, compose]
        navigationController?.isToolbarHidden = false
        
        searchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            controller.searchBar.backgroundColor = UIColor.white
            
            tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredData.count
        }
        return noteManager.notesCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var note = noteManager.note(at: indexPath.row)
        if searchController.isActive {
            note = filteredData[indexPath.row]
        }
        cell.textLabel?.text = note.text
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showComposeVC(indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            noteManager.delete(at: indexPath.row)
            tableView.reloadData()
        }
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

    override func viewDidAppear(_ animated: Bool) {
        noteManager = NoteManager()
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredData.removeAll()
        guard let filterWord = searchController.searchBar.text else { return }
        print(filterWord)
        filteredData = noteManager.notes.filter({$0.text.lowercased().contains(filterWord)})
        //TODO create filter! this one is bug
        tableView.reloadData()
    }

}

