//
//  TelluswhoyouareVC.swift
//  Love Bite
//
//  Created by iMac on 25/08/25.
//

import UIKit

class TelluswhoyouareVC: UIViewController {

    @IBOutlet weak var viewTopBar: UIView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewBottomBtn: UIView!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var titleHeightConst: NSLayoutConstraint!
    @IBOutlet weak var titleTopConst: NSLayoutConstraint!
    
    
    var isOpenProfile = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        if isOpenProfile {
            // Case: Opened from Profile
            lblTitle.isHidden = true
            viewTopBar.isHidden = false
            viewBottomBtn.isHidden = true
            progressView.isHidden = true
            titleHeightConst.constant = 0
            titleTopConst.constant = 0
        } else {
            // Case: Normal Flow
            lblTitle.text = "Tell us who you are!"
            lblTitle.isHidden = false
            viewTopBar.isHidden = true
            viewBottomBtn.isHidden = false
        }
    }

    @IBAction func clickedGoBack(_ sender: Any) {
        self.goBack(animated: false)
    }
    
    @IBAction func clickedBack(_ sender: Any) {
        self.goBack(animated: false)
    }
    
    @IBAction func clickedNext(_ sender: Any) {
        let vc = WhenisthebigdayVC()
        self.push(vc, animated: false)
    }
}
