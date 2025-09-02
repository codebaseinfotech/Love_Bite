//
//  UploadPhotoVC.swift
//  Love Bite
//
//  Created by iMac on 25/08/25.
//

import UIKit
import FirebaseAuth
import FirebaseStorage

class UploadPhotoVC: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        // Do any additional setup after loading the view.
    }

    @IBAction func clickedUploadProfile(_ sender: Any) {
        openGallery()
    }
    
    @IBAction func clickedNext(_ sender: Any) {
//        guard let imgPic = imgProfile.image else {
//            print("❌ No profile image selected")
//            AppDelegate.appDelegate.showAlertFromAppDelegate(title: "Error", message: "Please select a profile picture")
//            return
//        }
//        
//        uploadProfileImage(imgPic)
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
    
    func uploadProfileImage(_ image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 0.8),
              let user = Auth.auth().currentUser else {
            return
        }
        
        // Create a reference in Firebase Storage
        let storageRef = Storage.storage().reference().child("profile_images/\(user.uid).jpg")
        
        // Upload the file
        storageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("❌ Upload error: \(error.localizedDescription)")
                return
            }
            
            // Get download URL
            storageRef.downloadURL { url, error in
                if let error = error {
                    print("❌ Failed to get download URL: \(error.localizedDescription)")
                    return
                }
                
                if let photoURL = url {
                    // Update user profile with photoURL
                    let changeRequest = user.createProfileChangeRequest()
                    changeRequest.photoURL = photoURL
                    changeRequest.commitChanges { error in
                        if let error = error {
                            print("❌ Profile update error: \(error.localizedDescription)")
                        } else {
                            print("✅ Profile image updated: \(photoURL.absoluteString)")
                            LBUtulites.isSaveUserDetails(isUploadPic: true)
                            
                            let vc = TelluswhoyouareVC()
                            self.push(vc, animated: false)
                        }
                    }
                }
            }
        }
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
