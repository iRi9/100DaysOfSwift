//
//  ViewController.swift
//  Project7
//
//  Created by ebdesk-066 on 10/06/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]()
    var filterPetitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showApiInfo))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(filterPetition))
        
        let urlString: String
        if navigationController?.tabBarItem.tag == 0 {
           urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
        showError()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filterPetitions.count > 0 {
            return filterPetitions.count
        }
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var petition = petitions[indexPath.row]
        if filterPetitions.count > 0 {
            petition = filterPetitions[indexPath.row]
        }
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    
    func showError() {
        let alertVc = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; pleas check your connection and try again.", preferredStyle: .alert)
        
        alertVc.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertVc, animated: true)
    }
    
    @objc func showApiInfo() {
        let alertVc = UIAlertController(title: "API Info", message: "This data came from We The People API of the Whitehouse", preferredStyle: .alert)
        
        alertVc.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertVc, animated: true)
    }
    
    @objc func filterPetition() {
        let ac = UIAlertController(title: "Filter Petition", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let filterAction = UIAlertAction(title: "Filter", style: .default) { [weak self, weak ac] action in
            guard let filterString = ac?.textFields?[0].text else { return }
            self?.searchPetition(filterString.lowercased())
        }
        
        ac.addAction(filterAction)
        present(ac, animated: true)
    }
    
    func searchPetition(_ filterString: String) {
        print("filterString = \(filterString)")
        filterPetitions = petitions.filter{$0.title.lowercased().contains(filterString)}
        print("filter result = \(filterPetitions)")
        if filterPetitions.count == 0 {
            let ac = UIAlertController(title: "Not Found", message: "The data you are looking for does not exist", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
        tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
    }


}

