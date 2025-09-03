//
//  ChatVC.swift
//  Love Bite
//
//  Created by iMac on 01/09/25.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var viewBottomMain: UIView!
    
    @IBOutlet weak var tblViewChat: UITableView!
    
    let messages = Array(0..<20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblViewChat.register(UINib(nibName: "ReceiverChatTblViewCell", bundle: nil), forCellReuseIdentifier: "ReceiverChatTblViewCell")
        tblViewChat.register(UINib(nibName: "SenderChatTblViewCell", bundle: nil), forCellReuseIdentifier: "SenderChatTblViewCell")
        tblViewChat.delegate = self
        tblViewChat.dataSource = self

        addTopBorder(to: viewBottomMain, color: .primary, thickness: 1.0)
        // Do any additional setup after loading the view.
    }

    @IBAction func clickedBack(_ sender: Any) {
        self.goBack()
    }
    
    func addTopBorder(to view: UIView, color: UIColor, thickness: CGFloat) {
        // Remove existing border if already added (avoid duplicates on reloads)
        view.layer.sublayers?.filter { $0.name == "topBorder" }.forEach { $0.removeFromSuperlayer() }
        
        let border = CALayer()
        border.name = "topBorder"
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: thickness)
        view.layer.addSublayer(border)
    }

}

extension ChatVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SenderChatTblViewCell") as! SenderChatTblViewCell
                
            return cell
        } else {
            // Odd rows → Receiver
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiverChatTblViewCell") as! ReceiverChatTblViewCell
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
//        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 22
    }
    
    // MARK: - UITableView Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("ChatHeader", owner: nil, options: nil)?.first as? ChatHeader
        
        headerView?.lblTime
            .text = "Today"
        
        return headerView
    }
    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0.5
//    }
}
