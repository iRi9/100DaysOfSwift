//
//  TableViewController.swift
//  Project4
//
//  Created by ebdesk-066 on 23/05/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var websites = ["apple.com","hackingwithswift.com","9to5mac.com","makemac.grid.id"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? ViewController {
            vc.openWebsite = websites[indexPath.row]
            vc.websites = websites
            
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }

}
