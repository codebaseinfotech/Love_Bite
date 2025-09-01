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
    
    @IBOutlet weak var lblMenuOption: UILabel!
    @IBOutlet weak var viewMenu: UIView!
    
    
    
    private var menuView: UIView?
    private var overlayView: UIControl?
    private var selectedOption: String = "Private Messages"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.goBack()
    }
    
    @IBAction func tappedShowMenu(_ sender: UIButton) {
        if menuView != nil {
            closeMenu()
        } else {
            showCustomMenu(anchor: sender)
        }
    }
    
    func showCustomMenu(anchor: UIView) {
        let menuWidth: CGFloat = 200
        let menuHeight: CGFloat = 100
        
        // ✅ Convert anchor frame into self.view coordinates
        let anchorFrame = viewMenu.superview?.convert(viewMenu.frame, to: self.view) ?? viewMenu.frame
        
        let menuFrame = CGRect(x: 200,
                               y: anchorFrame.maxY + 8,
                               width: menuWidth,
                               height: menuHeight)
        
        // ✅ Add transparent overlay
        let overlay = UIControl(frame: self.view.bounds)
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.4) // faint dim
        overlay.addTarget(self, action: #selector(closeMenu), for: .touchUpInside)
        self.view.addSubview(overlay)
        self.overlayView = overlay
        
        // ✅ Container for menu
        let container = UIView(frame: menuFrame)
        container.backgroundColor = .white
        container.layer.cornerRadius = 12
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.2
        container.layer.shadowOffset = CGSize(width: 0, height: 2)
        container.layer.shadowRadius = 6
        
        let options = ["Private Messages", "Chat Room"]
        
        for (index, title) in options.enumerated() {
            let button = UIButton(frame: CGRect(x: 0, y: CGFloat(index) * 50, width: menuWidth, height: 50))
            button.setTitle(title, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.contentHorizontalAlignment = .left
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            button.tag = index
            button.addTarget(self, action: #selector(optionSelected(_:)), for: .touchUpInside)
            
            if title == selectedOption {
                button.setTitle("\(title) ✓", for: .normal)
            }
            
            container.addSubview(button)
        }
        
        overlay.addSubview(container)
        self.menuView = container
    }
    
    @objc func optionSelected(_ sender: UIButton) {
        let options = ["Private Messages", "Chat Room"]
        selectedOption = options[sender.tag]
        
        // update label
        lblMenuOption.text = selectedOption
        
        // close menu
        closeMenu()
    }
    
    @objc func closeMenu() {
        menuView?.removeFromSuperview()
        menuView = nil
        overlayView?.removeFromSuperview()
        overlayView = nil
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChatVC()
        self.push(vc)
    }
    
}
