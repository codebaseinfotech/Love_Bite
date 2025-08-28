//
//  LoveUserVC.swift
//  Love Bite
//
//  Created by Ankit Gabani on 28/08/25.
//

import UIKit

class LoveUserVC: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl! {
        didSet {
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white,
                .font: UIFont.boldSystemFont(ofSize: 16)
            ]
            segment.setTitleTextAttributes(attributes, for: .selected)
        }
    }
    
    @IBOutlet weak var tblViewActive: UITableView! {
        didSet {
            tblViewActive.register(UINib(nibName: "LoveUserListTVCell", bundle: nil), forCellReuseIdentifier: "LoveUserListTVCell")
            
            tblViewActive.delegate = self
            tblViewActive.dataSource = self
        }
    }
    @IBOutlet weak var tblViewExpired: UITableView! {
        didSet {
            tblViewExpired.register(UINib(nibName: "LoveUserListTVCell", bundle: nil), forCellReuseIdentifier: "LoveUserListTVCell")
            
            tblViewExpired.delegate = self
            tblViewExpired.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBacj(_ sender: Any) {
        self.goBack()
    }
    @IBAction func tappedSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            tblViewActive.isHidden = false
            tblViewExpired.isHidden = true
            
        } else {
            tblViewActive.isHidden = true
            tblViewExpired.isHidden = false
            
        }
    }
    
     

}

// MARK: - TV Delegate & DataSource
extension LoveUserVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblViewActive {
            return 5
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblViewActive {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoveUserListTVCell") as! LoveUserListTVCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoveUserListTVCell") as! LoveUserListTVCell
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProfileDetailsVC()
        self.push(vc)
    }
}
