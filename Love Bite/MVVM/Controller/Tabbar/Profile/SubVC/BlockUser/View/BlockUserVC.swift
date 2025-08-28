//
//  BlockUserVC.swift
//  Love Bite
//
//  Created by Ankit Gabani on 28/08/25.
//

import UIKit

class BlockUserVC: UIViewController {

    @IBOutlet weak var tblViewList: UITableView! {
        didSet {
            tblViewList.register(UINib(nibName: "LoveUserListTVCell", bundle: nil), forCellReuseIdentifier: "LoveUserListTVCell")
            
            tblViewList.delegate = self
            tblViewList.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.goBack()
    }
    

}

// MARK: - TV Delegate & DataSpource
extension BlockUserVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LoveUserListTVCell") as! LoveUserListTVCell
        
        cell.viewBlock.isHidden = false
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
