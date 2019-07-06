//
//  ViewController.swift
//  Country Facts
//
//  Created by ebdesk-066 on 06/07/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Country Fact"
        
        if let path = Bundle.main.url(forResource: "country_fact", withExtension: ".json") {
            if let countryFact = try? Data(contentsOf: path) {
                parse(json: countryFact)
                return
            }
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as? DetailViewController else { return }
        vc.countryName = countries[indexPath.row].name
        vc.facts = countries[indexPath.row].facts
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Countries.self, from: json) {
            countries = jsonPetitions.results
            tableView.reloadData()
        } else {
            let ac = UIAlertController(title: "Error", message: "Can't decode json", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }


}

