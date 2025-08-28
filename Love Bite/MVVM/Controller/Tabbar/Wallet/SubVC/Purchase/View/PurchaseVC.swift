//
//  PurchaseVC.swift
//  Love Bite
//
//  Created by Ankit Gabani on 28/08/25.
//

import UIKit

class PurchaseVC: UIViewController {
    
    @IBOutlet weak var collectionViewList: UICollectionView! {
        didSet {
            
            collectionViewList.register(UINib(nibName: "PurchaseCVCell", bundle: nil), forCellWithReuseIdentifier: "PurchaseCVCell")
            collectionViewList.delegate = self
            collectionViewList.dataSource = self
            collectionViewList.collectionViewLayout = flowLayout
        }
    }
    @IBOutlet weak var btnBuy: UIButton!
    
    let sectionInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    let itemsPerRow : CGFloat = 2
    var flowLayout: UICollectionViewFlowLayout {
        let _flowLayout = UICollectionViewFlowLayout()
        
        DispatchQueue.main.async {
            let paddingSpace = self.sectionInsets.left * (self.itemsPerRow + 1)
            let availableWidth = self.collectionViewList.frame.width - paddingSpace
            let widthPerItem = availableWidth / self.itemsPerRow
            
            _flowLayout.itemSize = CGSize(width: widthPerItem, height: 104)
            
            _flowLayout.sectionInset = self.sectionInsets
            _flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
            _flowLayout.minimumInteritemSpacing = 10
            _flowLayout.minimumLineSpacing = 10
        }
        
        // edit properties here
        return _flowLayout
    }
    
    var selectIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedBack(_ sender: Any) {
        self.goBack()
    }
    @IBAction func tappedBut(_ sender: Any) {
    }
    
    
}

// MARK: - CV Delegate & DataSource
extension PurchaseVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PurchaseCVCell", for: indexPath) as! PurchaseCVCell
        
        cell.imgSelect.isHidden = indexPath.row == selectIndex ? false : true
        cell.viewMain.borderColor = indexPath.row == selectIndex ? .primary : .clear
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectIndex = indexPath.row
        collectionView.reloadData()
    }
    
}
