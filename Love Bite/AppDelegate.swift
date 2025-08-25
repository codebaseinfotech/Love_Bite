//
//  AppDelegate.swift
//  Love Bite
//
//  Created by iMac on 25/08/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let initialViewController = LoginVC()
        let navigationController = UINavigationController(rootViewController: initialViewController)
        navigationController.navigationBar.isHidden = true
        window?.rootViewController = navigationController // Set your root view controller here
        window?.makeKeyAndVisible()
        
        return true
    }


}

