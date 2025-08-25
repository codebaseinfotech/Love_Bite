//
//  UIViewController+Extension.swift
//  Love Bite
//
//  Created by Ankit Gabani on 25/08/25.
//

import UIKit

extension UIViewController {
    func push(_ viewController: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func goBack(animated: Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }
    
}
