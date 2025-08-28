//
//  WalletVC.swift
//  Love Bite
//
//  Created by Ankit Gabani on 26/08/25.
//

import UIKit

class WalletVC: UIViewController {

    @IBOutlet weak var lblTotalToken: UILabel!
    @IBOutlet weak var lblTokenSpent: UILabel!
    @IBOutlet weak var lblTokenEarned: UILabel!
    @IBOutlet weak var lblTokenPurchesed: UILabel!
    @IBOutlet weak var lblTotalCashOur: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedCashOut(_ sender: Any) {
        let vc = CashOutVC()
        self.push(vc)
    }
    @IBAction func tappedPurchase(_ sender: Any) {
        let vc = PurchaseVC()
        self.push(vc)
    }
    @IBAction func tappedViewTranHistory(_ sender: Any) {
        let vc = TransactionHistoryVC()
        self.push(vc)
    }
    
    @IBAction func tappedThome(_ sender: Any) {
        self.changeTab(tab: 1)
    }
    @IBAction func tappedTFavouriite(_ sender: Any) {
        self.changeTab(tab: 2)
    }
    @IBAction func tappedTProfile(_ sender: Any) {
        self.changeTab(tab: 4)
    }
    

}
