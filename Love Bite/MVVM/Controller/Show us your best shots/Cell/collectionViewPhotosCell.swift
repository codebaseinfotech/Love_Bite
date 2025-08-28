//
//  collectionViewPhotosCell.swift
//  Love Bite
//
//  Created by iMac on 28/08/25.
//

import UIKit

protocol CollectionViewPhotosCellDelegate: AnyObject {
    func didTapAddPhoto()
    func didTapRemovePhoto(at index: Int)
}

class collectionViewPhotosCell: UICollectionViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var viewPhoto: UIView!
    @IBOutlet weak var viewAddPhoto: UIView!
    
    @IBOutlet weak var btnRemove: UIButton!
    
    weak var delegate: CollectionViewPhotosCellDelegate?
    var index: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addPhotoTapped))
        viewAddPhoto.isUserInteractionEnabled = true
        viewAddPhoto.addGestureRecognizer(tapGesture)
        
        // Remove button action
        btnRemove.addTarget(self, action: #selector(removePhotoTapped), for: .touchUpInside)
        // Initialization code
    }
    
    @objc private func addPhotoTapped() {
        delegate?.didTapAddPhoto()
    }
    
    @objc private func removePhotoTapped() {
        if let idx = index {
            delegate?.didTapRemovePhoto(at: idx)
        }
    }

}
