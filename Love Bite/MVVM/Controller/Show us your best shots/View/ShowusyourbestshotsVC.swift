//
//  ShowusyourbestshotsVC.swift
//  Love Bite
//
//  Created by iMac on 28/08/25.
//

import UIKit

class ShowusyourbestshotsVC: UIViewController {

    @IBOutlet weak var collectionViewPhotos: UICollectionView!
    
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
            _SlidarflowLayout.minimumInteritemSpacing = 2
            _SlidarflowLayout.minimumLineSpacing = 2
        }
        
        // edit properties here
        return _SlidarflowLayout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewPhotos.register(UINib(nibName: "collectionViewPhotosCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewPhotosCell")
        collectionViewPhotos.delegate = self
        collectionViewPhotos.dataSource = self
        collectionViewPhotos.collectionViewLayout =  SlidarflowLayout
        // Do any additional setup after loading the view.
    }

    @IBAction func clickedBack(_ sender: Any) {
        self.goBack(animated: false)
    }
    
    @IBAction func clickedNext(_ sender: Any) {
        
    }
    
}

extension ShowusyourbestshotsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionViewPhotos.dequeueReusableCell(withReuseIdentifier: "collectionViewPhotosCell", for: indexPath) as! collectionViewPhotosCell
        
        cell.viewPhoto.isHidden = true
        cell.viewAddPhoto.isHidden = true
        
        if indexPath.item == 0 {
            cell.viewPhoto.isHidden = false
        } else if indexPath.item == 1 {
            cell.viewAddPhoto.isHidden = false
        }
        
        return cell
    }
    
    
}
