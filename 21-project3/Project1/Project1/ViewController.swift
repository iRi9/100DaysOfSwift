//
//  ViewController.swift
//  Project1
//
//  Created by ebdesk-066 on 13/05/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        var tempPicture = [String]()
        for item in items {
            if item.hasPrefix("nssl") {
                tempPicture.append(item)
            }
        }
        
        pictures = tempPicture.sorted();
        
//        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            print(indexPath.row)
            vc.selectedImage = pictures[indexPath.row]
            vc.titleImage = "Picture \(indexPath.row+1) of \(pictures.count + 1)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

