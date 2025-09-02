//
//  MenuVC.swift
//  Love Bite
//
//  Created by Ankit Gabani on 28/08/25.
//

import UIKit
import FirebaseAuth

class MenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.goBack()
    }
    
    @IBAction func tappedLoveUser(_ sender: Any) {
        let vc = LoveUserVC()
        self.push(vc)
    }
    @IBAction func tappedGroupMembers(_ sender: Any) {
        let vc = MessagesVC()
        vc.selectedOption = "Chat Room"
        self.push(vc)
    }
    @IBAction func tappedBlockedUser(_ sender: Any) {
        let vc = BlockUserVC()
        self.push(vc)
    }
    @IBAction func tappedReferAFriend(_ sender: Any) {
        let vc = ReferAFriendVC()
        self.presentVC(vc, animated: false)
    }
    @IBAction func tappedChangePassword(_ sender: Any) {
        let vc = ChangePasswordVC()
        self.push(vc)
    }
    @IBAction func tappedNotification(_ sender: Any) {
        let vc = NotificationVC()
        self.push(vc)
    }
    @IBAction func tappedDeleteAccount(_ sender: Any) {
        let alert = UIAlertController(title: "Delete Account", message: "Are you sure you want to delete account?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            AppDelegate.appDelegate.setUpLogin()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func tappedTermsCondition(_ sender: Any) {
    }
    @IBAction func tappedPrivacyPolicy(_ sender: Any) {
    }
    
    @IBAction func tappedLogout(_ sender: Any) {
        let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Logout", style: .destructive, handler: { _ in
            AppDelegate.appDelegate.setUpLogin()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func logoutUser() {
        do {
            try Auth.auth().signOut()
            print("Logged out successfully")
            AppDelegate.appDelegate.setUpLogin()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
