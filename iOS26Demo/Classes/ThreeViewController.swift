//
//  ThreeViewController.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/1/13.
//

import UIKit
import SwiftUI

class ThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.title = "发现"
        view.backgroundColor = .white
        
        let products = [
            Product(id: "111", title: "商品1", imageURL: "", price: 0.0)
        ]
        
        let productview = ProductGridView(products: nil)
        let hostVc = UIHostingController(rootView: productview)
        addChild(hostVc)
        view.addSubview(hostVc.view)
        hostVc.didMove(toParent: self)
        hostVc.view.frame = CGRectMake(0, 0, UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
    }

}

