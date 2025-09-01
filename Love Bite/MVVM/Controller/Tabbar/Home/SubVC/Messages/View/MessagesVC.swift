//
//  MessagesVC.swift
//  Love Bite
//
//  Created by iMac on 01/09/25.
//

import UIKit

class MessagesVC: UIViewController {

    @IBOutlet weak var tblViewChatList: UITableView! {
        didSet {
            tblViewChatList.register(UINib(nibName: "ChatListTblViewCell", bundle: nil), forCellReuseIdentifier: "ChatListTblViewCell")
            tblViewChatList.delegate = self
            tblViewChatList.dataSource = self
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

extension MessagesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewChatList.dequeueReusableCell(withIdentifier: "ChatListTblViewCell") as! ChatListTblViewCell
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
