//
//  CreatePostVC.swift
//  Love Bite
//
//  Created by iMac on 01/09/25.
//

import UIKit

class CreatePostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var txtViewDescription: UITextView!
    @IBOutlet weak var txtTitle: UITextField!
    
    @IBOutlet weak var imgPost: UIImageView!
    
    @IBOutlet weak var btnPost: UIButton!
    
    
    let placeholderText = "Enter a description..."
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextView()
        txtTitle.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        updatePostButtonState()
        // Do any additional setup after loading the view.
    }
    
    func setupTextView() {
        txtViewDescription.delegate = self
        txtViewDescription.text = placeholderText
        txtViewDescription.textColor = .lightGray
    }

    @IBAction func clickedCancel(_ sender: Any) {
        self.goBack()
    }
    
    @IBAction func clickedPost(_ sender: Any) {
    }
    
    @IBAction func tappedAddPost(_ sender: Any) {
        let alert = UIAlertController(title: "Add Photo", message: "Choose an option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
        } else {
            showAlert("Camera not available")
        }
    }
    
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    // MARK: - UIImagePicker Delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[.editedImage] as? UIImage {
            imgPost.image = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            imgPost.image = originalImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    private func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Update Post Button State
    func updatePostButtonState() {
        let titleText = txtTitle.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let descriptionText = txtViewDescription.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        let isDescriptionValid = !(descriptionText.isEmpty || descriptionText == placeholderText)
        let isTitleValid = !titleText.isEmpty
        let isImageSet = imgPost.image != nil
        
        let shouldEnable = isTitleValid && isDescriptionValid && isImageSet
        btnPost.isEnabled = shouldEnable
        btnPost.alpha = shouldEnable ? 1.0 : 0.5
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        updatePostButtonState()
    }
}

extension CreatePostVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholderText {
            textView.text = ""
            textView.textColor = .label // normal text color
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = placeholderText
            textView.textColor = .lightGray
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        updatePostButtonState()
    }
    
}
