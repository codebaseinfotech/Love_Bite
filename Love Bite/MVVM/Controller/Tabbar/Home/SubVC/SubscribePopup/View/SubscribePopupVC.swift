//
//  SubscribePopupVC.swift
//  Love Bite
//
//  Created by Ankit Gabani on 01/09/25.
//

import UIKit

protocol SubscribeDidTap: AnyObject {
    func didTapOnChat()
}

class SubscribePopupVC: UIViewController {

    @IBOutlet weak var imgPic: UIImageView!
    @IBOutlet weak var lblNAme: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblOnline: UILabel!
    @IBOutlet weak var img1Token: UIImageView!
    @IBOutlet weak var img899Sub: UIImageView!
    @IBOutlet weak var viewMain: UIView! {
        didSet {
            viewMain.clipsToBounds = true
            viewMain.layer.cornerRadius = 20
            viewMain.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // Top Corner
                    
        }
    }
    @IBOutlet weak var view1Token: UIView!
    @IBOutlet weak var view899Sub: UIView!
    
    var delegateSub: SubscribeDidTap?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func tapped1Token(_ sender: Any) {
        img1Token.isHidden = false
        img899Sub.isHidden = true
        
        view1Token.borderWidth = 2
        view1Token.borderColor = .primary
        
        view899Sub.borderColor = .clear
        
    }
    @IBAction func tapped899Sub(_ sender: Any) {
        img1Token.isHidden = true
        img899Sub.isHidden = false
        
        view899Sub.borderWidth = 2
        view899Sub.borderColor = .primary
        
        view1Token.borderColor = .clear
    }
    @IBAction func tappedStartChat(_ sender: Any) {
        delegateSub?.didTapOnChat()
        self.goDismiss(animated: false)
    }
    @IBAction func tappedDus(_ sender: Any) {
        self.goDismiss(animated: false)
    }
    
    

}
