//
//  UploadPhotoVC.swift
//  Love Bite
//
//  Created by iMac on 25/08/25.
//

import UIKit

class UploadPhotoVC: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgProfile.layer.cornerRadius = imgProfile.frame.width / 2
        imgProfile.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

    @IBAction func clickedUploadProfile(_ sender: Any) {
        openGallery()
    }
    
    @IBAction func clickedNext(_ sender: Any) {
        let vc = TelluswhoyouareVC()
        self.push(vc, animated: false)
    }
    
    private func openGallery() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
}

extension UploadPhotoVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var selectedImage: UIImage?
        
        if let editedImage = info[.editedImage] as? UIImage {
            selectedImage = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            selectedImage = originalImage
        }
        
        if let image = selectedImage {
            imgProfile.image = image
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
