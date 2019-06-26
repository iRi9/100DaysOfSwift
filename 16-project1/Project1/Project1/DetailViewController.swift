//
//  DetailViewController.swift
//  Project1
//
//  Created by ebdesk-066 on 14/05/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var viewCount: UILabel!
    
    var selectedImage: String?
    var titleImage: String?
    var counter: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = titleImage
        navigationItem.largeTitleDisplayMode = .never

        // Do any additional setup after loading the view.
        if let imageToLoad = selectedImage {
            ImageView.image = UIImage(named: imageToLoad)
        }
        
        if let totalView = counter {
            viewCount.text = "Total view \(totalView)"
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.hidesBarsOnTap = false
    }
}
