//
//  ViewController.swift
//  Project50
//
//  Created by ebdesk-066 on 27/06/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var phototags = [Phototag]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
        
        let defaults = UserDefaults.standard
        
        if let savedPhoto = defaults.object(forKey: "phototags") as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                phototags = try jsonDecoder.decode([Phototag].self, from: savedPhoto)
            } catch {
                print("Failed to load people")
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phototags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let photo = phototags[indexPath.row]
        cell.textLabel?.text = photo.caption
        
        let path = getDocumentsDirectory().appendingPathComponent(photo.image)
        cell.imageView?.image = UIImage(contentsOfFile: path.path)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photo = phototags[indexPath.row]
        
        let ac = UIAlertController(title: "Enter caption or view detail", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Enter caption", style: .default) {[weak self] _ in
            self?.enterCaption(photo)
        })
        
        ac.addAction(UIAlertAction(title: "View detail", style: .default) {[weak self] _ in
            if let vc = self?.storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.caption = photo.caption
                vc.imagePath = self?.getDocumentsDirectory().appendingPathComponent(photo.image).path
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        })
        
        present(ac, animated: true)
    }
    
    @objc func addNewPerson() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            picker.sourceType = .camera
        }
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        let phototag = Phototag(image: imageName, caption: "No caption")
        phototags.append(phototag)
//        save()
        tableView.reloadData()
        
        dismiss(animated: true)
    }
    
    func getDocumentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    // TODO Fixing enter caption
    func enterCaption(_ phototag: Phototag) {
//        let ac = UIAlertController(title: "Enter caption", message: nil, preferredStyle: .alert)
//        ac.addTextField()
//
//        ac.addAction(UIAlertAction(title: "Ok", style: .default) { [weak self, weak ac] _ in
//            guard let caption = ac?.textFields?[0].text else { return }
//            phototag.caption = caption
//            self?.tableView.reloadData()
//        })
//
//        ac.addAction(UIAlertAction(title: "Cancle", style: .cancel))
//
//        present(ac, animated: true)
    }
    
    func save() {
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(phototags) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "phototags")
        } else {
            print("Failed to save people.")
        }
    }

}

