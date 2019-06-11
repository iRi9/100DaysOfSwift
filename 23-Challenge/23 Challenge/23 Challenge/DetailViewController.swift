//
//  DetailViewController.swift
//  23 Challenge
//
//  Created by ebdesk-066 on 20/05/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedFlag: String?

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFlag))
        
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        
        if let imageToLoad = selectedFlag {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    @objc func shareFlag() {
        
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("image not found!")
            return
        }
        
        guard let imageName = selectedFlag else {
            print("image has no name")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image,imageName], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(vc,animated: true)
    }
    

}
