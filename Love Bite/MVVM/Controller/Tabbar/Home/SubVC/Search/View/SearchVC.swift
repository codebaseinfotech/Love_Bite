//
//  SearchVC.swift
//  Love Bite
//
//  Created by Ankit Gabani on 01/09/25.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var tblView: UITableView! {
        didSet {
            tblView.register(UINib(nibName: "SearchListTVCell", bundle: nil), forCellReuseIdentifier: "SearchListTVCell")
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
    
    

}

// MARK: - TV Delegate & DataSource
extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchListTVCell") as! SearchListTVCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProfileDetailsVC()
        self.push(vc)
    }
    
    
}
