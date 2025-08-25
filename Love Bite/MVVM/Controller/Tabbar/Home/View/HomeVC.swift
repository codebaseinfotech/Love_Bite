//
//  HomeVC.swift
//  Love Bite
//
//  Created by Ankit Gabani on 25/08/25.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var lblChatCount: UILabel!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var collectionView24H: UICollectionView! {
        didSet {
            collectionView24H.register(UINib(nibName: "UserListCVCell", bundle: nil), forCellWithReuseIdentifier: "UserListCVCell")
            collectionView24H.delegate = self
            collectionView24H.dataSource = self
        }
    }
    @IBOutlet weak var collectionViewList: UICollectionView! {
        didSet {
            collectionViewList.register(UINib(nibName: "UserListCVCell", bundle: nil), forCellWithReuseIdentifier: "UserListCVCell")
            collectionViewList.delegate = self
            collectionViewList.dataSource = self
            collectionViewList.collectionViewLayout = flowLayout
            collectionViewList.reloadData()
            updateCollectionViewHeight()
        }
    }
    @IBOutlet weak var heightCollectionViewList: NSLayoutConstraint!
    
    let sectionInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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
    
    func updateCollectionViewHeight() {
        collectionViewList.performBatchUpdates(nil) { _ in
            self.heightCollectionViewList.constant = self.collectionViewList.collectionViewLayout.collectionViewContentSize.height
        }
    }

    @IBAction func tappedChat(_ sender: Any) {
    }
    @IBAction func tappedViewMore(_ sender: Any) {
        let vc = Active24HVC()
        self.push(vc)
    }
    
     

}

// MARK: - CV Delegate & DataSource
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView24H {
            return 7
        } else {
            return 20
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView24H {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserListCVCell", for: indexPath) as! UserListCVCell
            
            cell.viewImg.cornerRadius = cell.viewImg.frame.height / 2
            cell.viewImg.borderColor = #colorLiteral(red: 0.3450980392, green: 0.7176470588, blue: 0.7607843137, alpha: 1)
            cell.viewImg.borderWidth = 2
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserListCVCell", for: indexPath) as! UserListCVCell
            
            cell.viewImg.cornerRadius = cell.viewImg.frame.height / 2
            cell.viewImg.borderColor = #colorLiteral(red: 0.3450980392, green: 0.7176470588, blue: 0.7607843137, alpha: 1)
            cell.viewImg.borderWidth = 2
            
            return cell
        }
    }
    
    
}
