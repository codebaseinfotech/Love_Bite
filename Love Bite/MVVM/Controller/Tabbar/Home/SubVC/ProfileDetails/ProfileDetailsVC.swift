//
//  ProfileDetailsVC.swift
//  Love Bite
//
//  Created by Ankit Gabani on 25/08/25.
//

import UIKit

class ProfileDetailsVC: UIViewController {

    @IBOutlet weak var collectionViewImgList: UICollectionView! {
        didSet {
            collectionViewImgList.register(UINib(nibName: "GalleryListCVCell", bundle: nil), forCellWithReuseIdentifier: "GalleryListCVCell")
            collectionViewImgList.delegate = self
            collectionViewImgList.dataSource = self
            collectionViewImgList.collectionViewLayout = flowLayout
        }
    }
    @IBOutlet weak var pageCount: UIPageControl!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDes: UILabel!
    
    @IBOutlet weak var lblFOccupation: UILabel!
    @IBOutlet weak var lblAboutMe: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblOccupation: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblBodyType: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblEyeColor: UILabel!
    @IBOutlet weak var lblHairColor: UILabel!
    @IBOutlet weak var lblEthnicity: UILabel!
    @IBOutlet weak var lblInterstedIn: UILabel!
    
    @IBOutlet weak var tblViewPost: UITableView! {
        didSet {
            tblViewPost.register(UINib(nibName: "PostListTVCell", bundle: nil), forCellReuseIdentifier: "PostListTVCell")
            tblViewPost.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
            
            tblViewPost.delegate = self
            tblViewPost.dataSource = self
        }
    }
    @IBOutlet weak var heightTV: NSLayoutConstraint!
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "contentSize"){
            if let newvalue = change?[.newKey] {
                let newsize  = newvalue as! CGSize
                self.heightTV.constant = newsize.height
            }
        }
    }
    
    let sectionInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    let itemsPerRow : CGFloat = 1
    var flowLayout: UICollectionViewFlowLayout {
        let _flowLayout = UICollectionViewFlowLayout()
        
        DispatchQueue.main.async {
            let paddingSpace = self.sectionInsets.left * (self.itemsPerRow + 1)
            let availableWidth = self.collectionViewImgList.frame.width - paddingSpace
            let widthPerItem = availableWidth / self.itemsPerRow
            
            _flowLayout.itemSize = CGSize(width: widthPerItem, height: 600)
            
            _flowLayout.sectionInset = self.sectionInsets
            _flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
            _flowLayout.minimumInteritemSpacing = 0
            _flowLayout.minimumLineSpacing = 0
        }
        
        // edit properties here
        return _flowLayout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func tappedClose(_ sender: Any) {
        self.goBack()
    }
    @IBAction func tappedSubscribe(_ sender: Any) {
        let vc = SubscribePopupVC()
        self.presentVC(vc, animated: false)
    }
    @IBAction func tappedFavourite(_ sender: Any) {
    }
    @IBAction func tappedChat(_ sender: Any) {
    }
    @IBAction func tappedVideoCall(_ sender: Any) {
    }
    @IBAction func tappedMore(_ sender: Any) {
    }
    
  

}

// MARK: - CV Delegate & DataSource
extension ProfileDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryListCVCell", for: indexPath) as! GalleryListCVCell
        
        return cell
    }
    
    
}

// MARK: - TV Delegate & DataSource
extension ProfileDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostListTVCell") as! PostListTVCell
        
        return cell
    }
    
    
}
