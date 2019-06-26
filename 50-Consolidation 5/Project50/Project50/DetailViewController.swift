//
//  DetailViewController.swift
//  Project50
//
//  Created by ebdesk-066 on 27/06/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var captionLabel: UILabel!
    
    var imagePath: String?
    var caption: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imagePath = imagePath {
            imageView.image = UIImage(contentsOfFile: imagePath)
        }
        
        if let caption = caption {
            captionLabel.text = caption
        }

    }

}
