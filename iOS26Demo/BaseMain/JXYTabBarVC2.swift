//
//  JXYTabBarVC2.swift
//  JXYApp
//
//  Created by ptlCoder on 2024/5/23.
// UITab 写的

import UIKit

class JXYTabBarVC2: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        addTabs()
        
//         iOS26新增，向下滚动时，只显示第一个与UISearchTab的图标，中间显示辅助UITabAccessory
        if #available(iOS 26.0, *) {
            self.tabBarMinimizeBehavior = .onScrollDown
        } else {
            // Fallback on earlier versions
        }
        
         //悬浮条
        // iOS26新增
//        if #available(iOS 26.0, *) {
//            self.bottomAccessory = UITabAccessory(contentView: UIToolbar())
//        } else {
//            // Fallback on earlier versions
//        }

        
    }
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        setAppearance()
        
    }
}

extension JXYTabBarVC2 {
    
    fileprivate func addTabs() {
        tabs.append(configTab(FirstViewController(), title: "wechat", imageName: "consult_0", selectedImage: "consult_15", identifier: "tab_1", badgeValue: "3"))
        tabs.append(configTab(SecondViewController(), title: "通讯录", imageName: "information_0", selectedImage: "information_15", identifier: "tab_2"))
        tabs.append(configTab(FourViewController(), title: "我", imageName: "mine_0", selectedImage: "mine_15", identifier: "tab_4"))
        tabs.append(configSearchTab(SearchViewController(), title: "搜索"))
        selectedTab = tabs.first // 搜索
    }
    
    // MARK: 注意：为了防止被系统覆盖，此设置放到viewDidAppear中
    func setAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()

        let normal = appearance.stackedLayoutAppearance.normal
        normal.titleTextAttributes = [
            .foregroundColor: UIColor.gray,
            .font: UIFont.systemFont(ofSize: 14)
        ]
//        normal.iconColor = .gray // 如果tabBarItem.image图片渲染模式是alwaysOriginal，该方法设置无效，以实际图片为准

        let selected = appearance.stackedLayoutAppearance.selected
        selected.titleTextAttributes = [
            .foregroundColor: UIColor.red,
            .font: UIFont.systemFont(ofSize: 14)
        ]
//        selected.iconColor = .red

        appearance.inlineLayoutAppearance = appearance.stackedLayoutAppearance
        appearance.compactInlineLayoutAppearance = appearance.stackedLayoutAppearance

        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }

}


extension JXYTabBarVC2 {
    // MARK: 设置UITab
    func configTab(_ viewController: UIViewController,
                   title: String,
                   imageName: String,
                   selectedImage: String,
                   identifier: String,
                   badgeValue: String? = nil) -> UITab {
        
        let tab = UITab(title: title, image: UIImage(named: imageName), identifier: identifier) { tab in
            tab.badgeValue = badgeValue
            tab.userInfo = identifier
            return self.configViewController(viewController: viewController, title: title)
        }
        tab.viewController?.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        tab.viewController?.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)

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

extension JXYTabBarVC2 : UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelectTab selectedTab: UITab, previousTab: UITab?) {

    }
}
