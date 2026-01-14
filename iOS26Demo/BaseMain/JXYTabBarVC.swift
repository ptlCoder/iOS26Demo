//
//  JXYTabBarVC.swift
//  JXYApp
//
//  Created by ptlCoder on 2024/5/23.
//

import UIKit

class JXYTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        setUpChildViewController()
        
        self.delegate = self
        tabs.append(configTab(FirstViewController(), title: "wechat", imageName: "message", identifier: "tab_1", badgeValue: "3"))
        tabs.append(configTab(SecondViewController(), title: "通讯录", imageName: "person.2", identifier: "tab_2"))
        tabs.append(configTab(ThreeViewController(), title: "发现", imageName: "safari", identifier: "tab_3"))
        tabs.append(configTab(FourViewController(), title: "我", imageName: "person", identifier: "tab_4"))
        tabs.append(configSearchTab(SearchViewController(), title: "搜索"))
//        selectedTab = tabs.last // 搜索
        // iOS26新增，向下滚动时，只显示第一个与UISearchTab的图标，中间显示辅助UITabAccessory
        self.tabBarMinimizeBehavior = .onScrollDown
        // iOS26新增
        self.bottomAccessory = UITabAccessory(contentView: UIToolbar())
    }
    
}

extension JXYTabBarVC {
    // MARK: 设置UITab
    func configTab(_ viewController: UIViewController,
                   title: String,
                   imageName: String,
                   identifier: String,
                   badgeValue: String? = nil) -> UITab {
        
        let tab = UITab(title: title, image: UIImage(systemName: imageName), identifier: identifier) { tab in
            tab.badgeValue = badgeValue
            tab.userInfo = identifier
            return self.configViewController(viewController: viewController, title: title)
        }
        return tab
    }

    // MARK: 设置UISearchTab
    func configSearchTab(_ viewController: UIViewController, title: String) -> UISearchTab {
        // UISearchTab，从TabBar分离出来单独显示
        let searchTab = UISearchTab { tab in
            return self.configViewController(viewController: viewController, title: title)
        }
//        searchTab.automaticallyActivatesSearch = true
        return searchTab
    }

    // MARK: 设置UIViewController
    func configViewController(viewController: UIViewController, title: String) -> BaseNavViewController {
        let navigationController = BaseNavViewController(rootViewController: viewController)
        viewController.navigationItem.title = title
        return navigationController
    }
}

extension JXYTabBarVC {
    
    
    func setUpChildViewController() {
        let vc1 = FirstViewController()
        let nav1 = BaseNavViewController(rootViewController: vc1)
        addChild(vc: nav1, title: "首页", norImageName: "consult_0", selImageName: "consult_15")

        
        let vc2 = SecondViewController()
        let nav2 = BaseNavViewController(rootViewController: vc2)
        addChild(vc: nav2, title: "动态", norImageName: "information_0", selImageName: "information_15")
        
        
        let vc3 = ThreeViewController()
        let nav3 = BaseNavViewController(rootViewController: vc3)
        addChild(vc: nav3, title: "我的", norImageName: "mine_0", selImageName: "mine_15")
    }
    
    func addChild(vc: UIViewController, title: String, norImageName: String, selImageName: String) {
       
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: norImageName)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: selImageName)?.withRenderingMode(.alwaysOriginal)
        addChild(vc)
    }
}

extension JXYTabBarVC : UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelectTab selectedTab: UITab, previousTab: UITab?) {
//        if selectedTab is UISearchTab { // 点击了搜索
//            tabBar.isHidden = true
//        }else {
//            tabBar.isHidden = false
//        }
    }
}
