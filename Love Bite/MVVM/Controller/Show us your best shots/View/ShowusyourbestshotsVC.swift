//
//  ShowusyourbestshotsVC.swift
//  Love Bite
//
//  Created by iMac on 28/08/25.
//

import UIKit

class ShowusyourbestshotsVC: UIViewController {

    @IBOutlet weak var collectionViewPhotos: UICollectionView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var viewTopBar: UIView!
    @IBOutlet weak var viewBottomBtn: UIView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var titleTopConst: NSLayoutConstraint!
    @IBOutlet weak var titleHeightConst: NSLayoutConstraint!
    
    
    
    
    
    
    
    let SlidarsectionInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    let SlidaritemsPerRow : CGFloat = 1
    var SlidarflowLayout: UICollectionViewFlowLayout {
        let _SlidarflowLayout = UICollectionViewFlowLayout()
        
        DispatchQueue.main.async {
            let paddingSpace = self.SlidarsectionInsets.left * (self.SlidaritemsPerRow + 1)
            let availableWidth = self.collectionViewPhotos.frame.width - paddingSpace
            let widthPerItem = availableWidth / self.SlidaritemsPerRow
            
            _SlidarflowLayout.itemSize = CGSize(width: 106, height: 146)
            
            _SlidarflowLayout.sectionInset = self.SlidarsectionInsets
            _SlidarflowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
            _SlidarflowLayout.minimumInteritemSpacing = 5
            _SlidarflowLayout.minimumLineSpacing = 10
        }
        
        // edit properties here
        return _SlidarflowLayout
    }
    
    
    let imagePicker = UIImagePickerController()
    
    var selectedPhotos: [UIImage] = []
    
    var isOpenProfile = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self

        collectionViewPhotos.register(UINib(nibName: "collectionViewPhotosCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewPhotosCell")
        collectionViewPhotos.delegate = self
        collectionViewPhotos.dataSource = self
        collectionViewPhotos.collectionViewLayout =  SlidarflowLayout
        
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickedGoBack(_ sender: Any) {
        self.goBack(animated: false)
    }

    @IBAction func clickedBack(_ sender: Any) {
        self.goBack(animated: false)
    }
    
    @IBAction func clickedNext(_ sender: Any) {
        let vc = HomeVC()
        self.push(vc, animated: false)
    }
    
    private func setupUI() {
        if isOpenProfile {
            // Case: Opened from Profile
            lblTitle.isHidden = true
            viewTopBar.isHidden = false
            viewBottomBtn.isHidden = true
            progressView.isHidden = true
            titleHeightConst.constant = 0
            titleTopConst.constant = 0
        } else {
            // Case: Normal Flow
            lblTitle.text = "Show us your best shots"
            lblTitle.isHidden = false
            viewTopBar.isHidden = true
            viewBottomBtn.isHidden = false
        }
    }
    
}

extension ShowusyourbestshotsVC: UICollectionViewDelegate, UICollectionViewDataSource, CollectionViewPhotosCellDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // All photos + 1 "Add" cell
        return selectedPhotos.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionViewPhotos.dequeueReusableCell(withReuseIdentifier: "collectionViewPhotosCell", for: indexPath) as! collectionViewPhotosCell
        
        cell.viewPhoto.isHidden = true
        cell.viewAddPhoto.isHidden = true
        cell.delegate = self
        cell.index = indexPath.item
        
        if indexPath.item < selectedPhotos.count {
            // Photo cell
            cell.viewPhoto.isHidden = false
            cell.imgProfile.image = selectedPhotos[indexPath.item]
            cell.btnRemove.isHidden = false
        } else {
            // Add Photo cell
            cell.viewAddPhoto.isHidden = false
            cell.btnRemove.isHidden = true
        }
        
        return cell
    }
    
    // Add photo tapped
    func didTapAddPhoto() {
        let alert = UIAlertController(title: "Choose Option", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Remove photo tapped
    func didTapRemovePhoto(at index: Int) {
        if index < selectedPhotos.count {
            selectedPhotos.remove(at: index)
            collectionViewPhotos.reloadData()
        }
    }
}

// MARK: - Image Picker
extension ShowusyourbestshotsVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            // 🔹 Add image to array
            selectedPhotos.append(selectedImage)
            collectionViewPhotos.reloadData()
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
