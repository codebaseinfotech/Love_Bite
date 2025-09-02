//
//  AppDelegate.swift
//  Love Bite
//
//  Created by iMac on 25/08/25.
//

import UIKit
import FirebaseCore
import FirebaseAuth

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static var appDelegate: AppDelegate {
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
    //    setUpCurrentLogin()
        setUpLogin()
        return true
    }
    
    // MARK: - setUp Login
    func setUpCurrentLogin() {
        if LBUtulites.getUserLogin().isLogin {
            if LBUtulites.getUserLogin().isConfirmUpdate {
                setUpHome()
            } else {
                if LBUtulites.getUserDetails().isUploadPic == false {
                    setUpRegiserDetails(vc: UploadPhotoVC())
                    
                } else if LBUtulites.getUserDetails().isUploadUserDetails == false {
                    setUpRegiserDetails(vc: TelluswhoyouareVC())
                    
                } else if LBUtulites.getUserDetails().isUploadDOB == false {
                    setUpRegiserDetails(vc: WhenisthebigdayVC())
                    
                } else if LBUtulites.getUserDetails().isUploadFewDetails == false {
                    setUpRegiserDetails(vc: ShareafewdetailsVC())
                    
                } else if LBUtulites.getUserDetails().isHowYouEarn == false {
                    setUpRegiserDetails(vc: DecideHowYouWillEarnVC())
                    
                } else if LBUtulites.getUserDetails().isUploadPicCollection == false {
                    setUpRegiserDetails(vc: ShowusyourbestshotsVC())
                    
                }
            }
        } else {
            setUpLogin()
        }
    }

    func setUpHome() {
        let initialViewController = HomeVC()
        let navigationController = UINavigationController(rootViewController: initialViewController)
        navigationController.navigationBar.isHidden = true
        window?.rootViewController = navigationController // Set your root view controller here
        window?.makeKeyAndVisible()
    }
    
    func setUpLogin() {
        let initialViewController = LoginVC()
        let navigationController = UINavigationController(rootViewController: initialViewController)
        navigationController.navigationBar.isHidden = true
        window?.rootViewController = navigationController // Set your root view controller here
        window?.makeKeyAndVisible()
    }
    
    func setUpRegiserDetails(vc: UIViewController) {
        let initialViewController = vc
        let navigationController = UINavigationController(rootViewController: initialViewController)
        navigationController.navigationBar.isHidden = true
        window?.rootViewController = navigationController // Set your root view controller here
        window?.makeKeyAndVisible()
    }
    
    func showAlertFromAppDelegate(title: String, message: String) {
        guard let topVC = UIApplication.shared.windows.first?.rootViewController else {
            print("❌ No root view controller found to present alert.")
            return
        }

        // Find top-most presented VC
        var visibleVC = topVC
        while let presented = visibleVC.presentedViewController {
            visibleVC = presented
        }

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))

        visibleVC.present(alert, animated: true)
    }

}


extension User {
    
    /// Returns a safe display name (falls back to email if displayName is nil)
    var displayNameOrEmail: String {
        return self.displayName ?? self.email ?? "Unknown User"
    }
    
    /// Returns the profile photo URL if set
    var profileImageURL: URL? {
        return self.photoURL
    }
    
    /// Returns true if the user has verified their email
    var isEmailVerifiedUser: Bool {
        return self.isEmailVerified
    }
    
    /// Returns basic user info as dictionary (handy for Firestore)
    var userInfoDict: [String: Any] {
        return [
            "uid": self.uid,
            "email": self.email ?? "",
            "displayName": self.displayName ?? "",
            "photoURL": self.photoURL?.absoluteString ?? "",
            "isEmailVerified": self.isEmailVerified
        ]
    }
}
