//
//  ChatVC.swift
//  Love Bite
//
//  Created by iMac on 01/09/25.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var viewBottomMain: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewBottomMain.addBorder(to: .top, color: .primary, thickness: 1)
        // Do any additional setup after loading the view.
    }

    @IBAction func clickedBack(_ sender: Any) {
        self.goBack()
    }
    
  

}
