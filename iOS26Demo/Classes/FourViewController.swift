//
//  FourViewController.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/1/13.
//

import UIKit
import SwiftUI

class FourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "搜索"
//        let profileView = ProfileViewSwiftUI(userId: "111111") { str in
//            print("点击了按钮: \(str)")
//        }
//        let hostingVC = UIHostingController(rootView: profileView)
//        hostingVC.view.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: 200)
//        
//        addChild(hostingVC)
//        view.addSubview(hostingVC.view)
//        hostingVC.didMove(toParent: self)
//        hostingVC.view.backgroundColor = .yellow
//        

        let walletView = AyAiWalletHeadViewSwiftUI()
        let walletVC = UIHostingController(rootView: walletView)
        addChild(walletVC)
        view.addSubview(walletVC.view)
        walletVC.didMove(toParent: self)
        walletVC.view.frame = CGRect(x: 0, y: 88, width: UIScreen.main.bounds.size.width, height: 600)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
