//
//  BaseNavViewController.swift
//  JXYApp
//
//  Created by ptlCoder on 2024/7/6.
//

import UIKit

class BaseNavViewController: UINavigationController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {

    // 🔒 记录历史最大进度，防止慢滑 → 快甩进度跳变
    private var maxProgress: CGFloat = 0
    /// 视觉完成阈值（40% 手势 ≈ 100% 视觉）
        private let visualThreshold: CGFloat = 0.4

    
    override func viewDidLoad() {
        super.viewDidLoad()

//        setupNavigationBar()
        
        self.delegate = self

    }
}

extension BaseNavViewController {
    // 监听 Push/Pop 行为
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        // 关键点：获取转场协调器
        guard let coordinator = viewController.transitionCoordinator else { return }
        
        // 获取根部的 TabBar
        let tabBar = self.tabBarController?.tabBar
        
        coordinator.animate(alongsideTransition: { context in
            // 判断当前是 Push 还是 Pop（侧滑返回属于 Pop）
            let isPushing = context.viewController(forKey: .from) === self.viewControllers.first && context.viewController(forKey: .to) !== self.viewControllers.first
            let isPoppingToRoot = context.viewController(forKey: .to) === self.viewControllers.first

            if isPoppingToRoot {
                // 正在侧滑返回首页，让 TabBar 随手势进度从 0 变回 1
//                    tabBar?.alpha = 1.0
                self.tabBarController?.setTabBarHidden(false, animated: true)
            } else if isPushing {
                // 正在从首页 Push 出去，让 TabBar 渐渐消失
//                    tabBar?.alpha = 0.0
                self.tabBarController?.setTabBarHidden(true, animated: true)
            }
        }, completion: { context in
            // 如果用户侧滑一半又取消了（滑回去），需要还原状态
            if context.isCancelled {
                let isCancelledPop = context.viewController(forKey: .from) !== self.viewControllers.first
                if isCancelledPop {
//                        tabBar?.alpha = 0.0 // 保持隐藏
                    self.tabBarController?.isTabBarHidden = true
//                        self.tabBarController?.setTabBarHidden(true, animated: true)
                }
            }
        })
    }
}


extension BaseNavViewController {
    private func setupNavigationBar() {
        // 启用大标题
        self.navigationBar.prefersLargeTitles = true
        // 强制关闭透明度（即使系统默认为 true）
//        navigationBar.isTranslucent = true
        // 额外保障：确保标题在切换时不会被遮挡
        navigationItem.hidesBackButton = false

        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            
            // 设置背景色（支持深色模式）
//            appearance.backgroundColor = UIColor.systemRed
            
            // 普通标题样式
            appearance.titleTextAttributes = [
                .foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 28, weight: .semibold)
            ]
            
//             // 大标题样式
//            appearance.largeTitleTextAttributes = [
//                .foregroundColor: UIColor.white,
//                .font: UIFont.systemFont(ofSize: 30, weight: .bold)
//            ]
//            
            // 返回按钮样式
            appearance.buttonAppearance.normal.titleTextAttributes = [
                .foregroundColor: UIColor.white
            ]
            
            // 应用到所有状态：标准、滚动边缘、紧凑模式
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance = appearance
        }
    }
}
