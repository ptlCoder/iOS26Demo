//
//  BaseNavViewController.swift
//  JXYApp
//
//  Created by ptlCoder on 2024/7/6.
//

import UIKit

class BaseNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationBar.isTranslucent = false
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
