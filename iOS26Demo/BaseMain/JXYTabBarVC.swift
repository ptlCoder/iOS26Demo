//
//  JXYTabBarVC.swift
//  JXYApp
//
//  Created by ptlCoder on 2024/5/23.
// UITabBarItem 写的

import UIKit

class JXYTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.delegate = self

        setUpChildViewController()
//
        // 示例：为“消息”标签设置红色徽章，与选中状态一致
        let messageItem = children[1].tabBarItem
        messageItem?.badgeValue = "3" // 设置角标，其他熟悉见setAppearance
 
        
        
        // 悬浮条
        // iOS26新增
        if #available(iOS 26.0, *) {
//            self.bottomAccessory = UITabAccessory(contentView: UIToolbar())
        } else {
            // Fallback on earlier versions
        }
        
        // iOS26新增，向下滚动时，只显示第一个与UISearchTab的图标，中间显示辅助UITabAccessory
        if #available(iOS 26.0, *) {
            self.tabBarMinimizeBehavior = .onScrollDown
        } else {
            // Fallback on earlier versions
        }
        
        
    }
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // MARK: 注意：为了防止被系统覆盖，此设置放到viewDidAppear中
        setAppearance()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

extension JXYTabBarVC {
    
    // MARK: 注意：为了防止被系统覆盖，此设置放到viewDidAppear中
    func setAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()

        // 默认文字
        let normal = appearance.stackedLayoutAppearance.normal
        normal.titleTextAttributes = [
            .foregroundColor: UIColor.gray,
//            .font: UIFont.systemFont(ofSize: 18)
        ]
        // 默认文字偏移量
//        normal.titlePositionAdjustment = UIOffset(horizontal: 5, vertical: -5)
        
        // 如果tabBarItem.image图片渲染模式是alwaysOriginal，该方法设置无效，以实际图片为准
//        normal.iconColor = .gray

        // 设置角标
        normal.badgeBackgroundColor = .black
        normal.badgeTextAttributes = [.foregroundColor: UIColor.white,
//                                      .font: UIFont.systemFont(ofSize: 15)
        ]
        // 设置角标偏移量
//        normal.badgePositionAdjustment = UIOffset(horizontal: -5, vertical: -5)
        
        
        let selected = appearance.stackedLayoutAppearance.selected
        selected.titleTextAttributes = [
            .foregroundColor: UIColor.red,
//            .font: UIFont.systemFont(ofSize: 18)
        ]
        // 默认文字偏移量
//        selected.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)
        
        // 如果tabBarItem.image图片渲染模式是alwaysOriginal，该方法设置无效，以实际图片为准
//        selected.iconColor = .red

        // 设置角标
        selected.badgeBackgroundColor = .red
        selected.badgeTextAttributes = [.foregroundColor: UIColor.white,
//                                        .font: UIFont.systemFont(ofSize: 15)
        ]
        // 设置角标偏移量
//        selected.badgePositionAdjustment = UIOffset(horizontal: -5, vertical: -5)
        
        
        appearance.inlineLayoutAppearance = appearance.stackedLayoutAppearance
        appearance.compactInlineLayoutAppearance = appearance.stackedLayoutAppearance

        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
        
    }

}

extension JXYTabBarVC {
    
    func setUpChildViewController() {
        let vc1 = FirstViewController()
        let nav1 = BaseNavViewController(rootViewController: vc1)
        addChild(vc: nav1, title: "首页", norImageName: "consult_0", selImageName: "consult_15")

        
        let vc2 = SecondViewController()
        let nav2 = BaseNavViewController(rootViewController: vc2)
        addChild(vc: nav2, title: "通讯录", norImageName: "information_0", selImageName: "information_15")
        
        
        let vc3 = ThreeViewController()
        let nav3 = BaseNavViewController(rootViewController: vc3)
        addChild(vc: nav3, title: "", norImageName: "center_icon", selImageName: "center_icon")
        
        let vc4 = SearchViewController()
        let nav4 = BaseNavViewController(rootViewController: vc4)
        addChild(vc: nav4, title: "搜索", norImageName: "mine_0", selImageName: "mine_15")
        
        let vc5 = ThreeViewController()
        let nav5 = BaseNavViewController(rootViewController: vc5)
        addChild(vc: nav5, title: "我的", norImageName: "mine_0", selImageName: "mine_15")
        
    }
    
    func addChild(vc: UIViewController, title: String, norImageName: String, selImageName: String) {
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: norImageName)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: selImageName)?.withRenderingMode(.alwaysOriginal)
        addChild(vc)
    }

}

extension JXYTabBarVC {
    // MARK: 设置UISearchTab
    func configSearchTab(_ viewController: UIViewController, title: String) -> UISearchTab {
        // UISearchTab，从TabBar分离出来单独显示
        let searchTab = UISearchTab { tab in
            
            let navigationController = BaseNavViewController(rootViewController: viewController)
            viewController.navigationItem.title = title
            return navigationController
        }
//        searchTab.automaticallyActivatesSearch = true
        return searchTab
    }
}

extension JXYTabBarVC : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}
