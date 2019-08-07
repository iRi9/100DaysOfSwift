//
//  DetailViewController.swift
//  Project1
//
//  Created by ebdesk-066 on 14/05/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var titleImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = titleImage
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        if let imageToLoad = selectedImage {
//            imageView.image = UIImage(named: imageToLoad)
            
            let imageSize = imageView.frame.size
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: imageSize.width, height: imageSize.height))
            
            let caption = renderer.image { ctx in
                
                let mImage = UIImage(named: imageToLoad)
                mImage?.draw(at: CGPoint(x: 0, y: 0))
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = .center
                
                let attrs: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 24),
                    .paragraphStyle: paragraphStyle
                ]
                
                let string = "From Storm Viewer"
                let attributedString = NSAttributedString(string: string, attributes: attrs)
                
                attributedString.draw(with: CGRect(x: 50, y: 70, width: 448, height: 448), options: .usesLineFragmentOrigin, context: nil)
                
            }
            
            imageView.image = caption
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
    
    @objc func shareTapped() {
        
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("image not found!")
            return
        }
        
        guard let imageName = selectedImage else {
            print("image has no name")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image,imageName], applicationActivities:[])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
