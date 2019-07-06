//
//  DetailTableViewController.swift
//  Country Facts
//
//  Created by ebdesk-066 on 06/07/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var countryName: String?
    var fatcs =  [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let country = countryName {
            title = country
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fatcs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        
        return cell
    }

}
