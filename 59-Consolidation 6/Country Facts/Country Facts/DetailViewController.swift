//
//  DetailViewController.swift
//  Country Facts
//
//  Created by ebdesk-066 on 06/07/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    var countryName: String?
    var facts =  [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let country = countryName {
            title = country
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return facts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fact", for: indexPath)
        cell.textLabel?.text = facts[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }

}
