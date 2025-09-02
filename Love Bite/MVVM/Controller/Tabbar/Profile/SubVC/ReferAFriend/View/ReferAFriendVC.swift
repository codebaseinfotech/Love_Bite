//
//  ReferAFriendVC.swift
//  Love Bite
//
//  Created by Ankit Gabani on 29/08/25.
//

import UIKit

class ReferAFriendVC: UIViewController {

    @IBOutlet weak var lblToken: UILabel!
    @IBOutlet weak var lblCode: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedCopy(_ sender: Any) {
    }
    @IBAction func tappedShareCode(_ sender: Any) {
    }
    @IBAction func tappedDis(_ sender: Any) {
        self.dismiss(animated: false)
    }
    

}
