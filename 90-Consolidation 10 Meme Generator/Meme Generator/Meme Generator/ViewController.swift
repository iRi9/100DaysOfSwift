//
//  ViewController.swift
//  Meme Generator
//
//  Created by ebdesk-066 on 07/08/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var bottomButton: UIButton!
    @IBOutlet var topButton: UIButton!
    @IBOutlet var imageView: UIImageView!
    private var imageData: Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Meme Generator"
        
        topButton.isHidden = true
        bottomButton.isHidden = true
        
        let addBar = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createMeme))
        let shareBar = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareMeme))
        
        navigationItem.rightBarButtonItems = [addBar, shareBar]
        
    }
    
    @objc func createMeme() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc func shareMeme() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("image not found!")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities:[])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        
        topButton.isHidden = false
        bottomButton.isHidden = false
        
        // Add image to image view
        imageView.image = image
        imageData = image.jpegData(compressionQuality: 0.5)
    }
    
    @IBAction func addTextTapped(_ sender: UIButton) {
        let position = sender.tag
        print("\(position)")
        if position == 0 {
            //MARK - Add top text
            inputText(position)
        } else if position == 1 {
            //MARK - Add bottom text
            inputText(position)
        }
        
    }
    
    func inputText(_ position: Int) {
        let ac = UIAlertController(title: "Add text", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Ok", style: .default) { [weak self, weak ac] action in
            guard let text = ac?.textFields?[0].text else { return }
            self?.generateMeme(at: position, text: text)
        })
        present(ac, animated: true)
    }
    
    func generateMeme(at position: Int, text: String) {
        let imageSize = imageView.image!.size
        let canvas = UIGraphicsImageRenderer(size: imageSize)
        let memeImage = canvas.image { ctx in
            imageView!.image!.draw(at: CGPoint(x: 0, y: 0))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center

            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont(name: "Georgia-Bold", size: 45),
                .foregroundColor: UIColor.red,
                .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle as NSString,
                .paragraphStyle: paragraphStyle
            ]

            let attributedString = NSAttributedString(string: text, attributes: attrs)

            if position == 0 {
                attributedString.draw(with: CGRect(x: 30, y: 30, width: imageSize.width, height: imageSize.height), options: .usesLineFragmentOrigin, context: nil)
            } else if position == 1 {
                attributedString.draw(with: CGRect(x: 30, y: imageSize.height - 100, width: imageSize.width, height: imageSize.height), options: .usesLineFragmentOrigin, context: nil)
            }
        
        }
        
        imageView.image = memeImage
    }
    

}

