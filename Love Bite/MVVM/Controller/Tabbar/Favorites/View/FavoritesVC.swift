//
//  FavoritesVC.swift
//  Love Bite
//
//  Created by Ankit Gabani on 25/08/25.
//

import UIKit

class FavoritesVC: UIViewController {

    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var collectionViewList: UICollectionView! {
        didSet {
            collectionViewList.register(UINib(nibName: "UserListCVCell", bundle: nil), forCellWithReuseIdentifier: "UserListCVCell")
            collectionViewList.delegate = self
            collectionViewList.dataSource = self
            collectionViewList.collectionViewLayout = flowLayout
            collectionViewList.reloadData()
        }
    }
    
    let sectionInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    let itemsPerRow : CGFloat = 3
    var flowLayout: UICollectionViewFlowLayout {
        let _flowLayout = UICollectionViewFlowLayout()
        
        DispatchQueue.main.async {
            let paddingSpace = self.sectionInsets.left * (self.itemsPerRow + 1)
            let availableWidth = self.collectionViewList.frame.width - paddingSpace
            let widthPerItem = availableWidth / self.itemsPerRow
            
            _flowLayout.itemSize = CGSize(width: widthPerItem-10, height: 111)
            
            _flowLayout.sectionInset = self.sectionInsets
            _flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
            _flowLayout.minimumInteritemSpacing = 10
            _flowLayout.minimumLineSpacing = 10
        }
        
        // edit properties here
        return _flowLayout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedTHome(_ sender: Any) {
        self.changeTab(tab: 1)
    }
    @IBAction func tappedWallet(_ sender: Any) {
        self.changeTab(tab: 3)
    }
    @IBAction func tappedTProfile(_ sender: Any) {
    }
    
  

}


// MARK: - CV Delegate & DataSource
extension FavoritesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserListCVCell", for: indexPath) as! UserListCVCell
        
        cell.viewImg.cornerRadius = cell.viewImg.frame.height / 2
        cell.viewImg.borderColor = #colorLiteral(red: 0.3450980392, green: 0.7176470588, blue: 0.7607843137, alpha: 1)
        cell.viewImg.borderWidth = 2
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ProfileDetailsVC()
        self.push(vc)
    }
    
}
