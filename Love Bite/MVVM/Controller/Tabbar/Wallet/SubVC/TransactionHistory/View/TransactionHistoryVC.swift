//
//  TransactionHistoryVC.swift
//  Love Bite
//
//  Created by Ankit Gabani on 26/08/25.
//

import UIKit

class TransactionHistoryVC: UIViewController {

    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var segment: UISegmentedControl! {
        didSet {
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white,
                .font: UIFont.boldSystemFont(ofSize: 16)
            ]
            segment.setTitleTextAttributes(attributes, for: .selected)
        }
    }
    @IBOutlet weak var tblView: UITableView! {
        didSet {
            tblView.register(UINib(nibName: "TransactionHistoryTVCell", bundle: nil), forCellReuseIdentifier: "TransactionHistoryTVCell")
            
            tblView.delegate = self
            tblView.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.goBack()
    }
    @IBAction func tappedSegment(_ sender: UISegmentedControl) {
    }
    
}

// MARK: - TV Delegate & DataSource
extension TransactionHistoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionHistoryTVCell") as! TransactionHistoryTVCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
