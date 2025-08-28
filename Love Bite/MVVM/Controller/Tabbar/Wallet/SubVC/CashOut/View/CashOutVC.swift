//
//  CashOutVC.swift
//  Love Bite
//
//  Created by Ankit Gabani on 28/08/25.
//

import UIKit

class CashOutVC: UIViewController {

    @IBOutlet weak var lblTotalToken: UILabel!
    @IBOutlet weak var lblCashOut: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.goBack()
    }
    @IBAction func tappedCashour(_ sender: Any) {
    }
    
    

}
