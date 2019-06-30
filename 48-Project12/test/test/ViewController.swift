//
//  ViewController.swift
//  test
//
//  Created by ebdesk-066 on 25/06/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefault = UserDefaults.standard
        
        userDefault.set(25, forKey: "Age")
        userDefault.set(true, forKey: "UseFaceId")
        userDefault.set(CGFloat.pi, forKey: "Pi")
        
        userDefault.set("Pampam", forKey: "Name")
        userDefault.set(Date(), forKey: "LastRun")
        
        let arr = ["hai", "hallo"]
        userDefault.set(arr, forKey: "ArraySaveed")
        
        let dict = ["name":"Pampam", "hoby":"running"]
        userDefault.set(dict, forKey: "DictionarySaved")
        
        let age = userDefault.integer(forKey: "Age")
        let isUseFaceId = userDefault.bool(forKey: "UseFaceId")
        let pi = userDefault.float(forKey: "Pi")
        
        let name = userDefault.string(forKey: "Name")
        let lastRun = userDefault.object(forKey: "LastRun") as? Date ?? Date()
        
        // Nill coalacing use double question mark like ??
        let array = userDefault.array(forKey: "ArraySaved") as? [String] ?? [String]()
        let dictionary = userDefault.dictionary(forKey: "DictionarySaved") as? [String:String] ?? [String:String]()
        
        
    }


}

