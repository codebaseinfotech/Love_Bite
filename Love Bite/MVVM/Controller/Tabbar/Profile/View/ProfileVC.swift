//
//  ProfileVC.swift
//  Love Bite
//
//  Created by Ankit Gabani on 28/08/25.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var imgProfike: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var tblView: UITableView! {
        didSet {
            tblView.register(UINib(nibName: "PostListTVCell", bundle: nil), forCellReuseIdentifier: "PostListTVCell")
            tblView.delegate = self
            tblView.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedNotification(_ sender: Any) {
    }
    @IBAction func tappedMenu(_ sender: Any) {
        let vc = MenuVC()
        self.push(vc)
    }
    @IBAction func tappedEditProfile(_ sender: Any) {
        let vc = EditProfileVC()
        self.push(vc)
    }
    @IBAction func tappedPreview(_ sender: Any) {
        let vc = ProfileDetailsVC()
        self.push(vc)
    }
    @IBAction func tappedCreateNew(_ sender: Any) {
    }
    
    @IBAction func tappedHome(_ sender: Any) {
        self.changeTab(tab: 1)
    }
    @IBAction func tappedFavourite(_ sender: Any) {
        self.changeTab(tab: 2)
    }
    @IBAction func tappedWallet(_ sender: Any) {
        self.changeTab(tab: 3)
    }
    
}

// MARK: - TV Delegate & DataSource
extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostListTVCell") as! PostListTVCell
        
        cell.tappedMore = {
            self.showPostOptions()
        }
        
        return cell
    }
    
    @objc func showPostOptions() {
        let alert = UIAlertController(title: "Post Options", message: nil, preferredStyle: .actionSheet)
        
        // Edit Post
        alert.addAction(UIAlertAction(title: "Edit Post", style: .default, handler: { _ in
            print("Edit Post tapped")
            // 👉 Navigate to edit screen or perform edit logic here
        }))
        
        // Delete Post
        alert.addAction(UIAlertAction(title: "Delete Post", style: .destructive, handler: { _ in
            print("Delete Post tapped")
            // 👉 Show confirmation or delete logic here
        }))
        
        // Cancel
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
}
