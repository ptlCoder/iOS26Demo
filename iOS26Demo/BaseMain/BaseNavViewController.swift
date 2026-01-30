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
        
//        guard let popGesture = interactivePopGestureRecognizer else { return }
//        popGesture.delegate = self
//        popGesture.addTarget(self, action: #selector(handlePopGesture(_:)))
        
        self.delegate = self
    }
    
    // 监听 Push/Pop 行为
        func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
            
            // 关键点：获取转场协调器
            guard let coordinator = viewController.transitionCoordinator else { return }
            
            // 获取根部的 TabBar
//            let tabBar = self.tabBarController?.tabBar
            
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
                        self.tabBarController?.setTabBarHidden(true, animated: true)
                    }
                }
            })
        }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        guard let coordinator = transitionCoordinator,
//        let tabBar = tabBarController?.tabBar else { return }
//
//        coordinator.notifyWhenInteractionChanges { context in
//            if context.isCancelled {
//                // ❌ pop 取消：仍停留在当前 VC（沉浸态）
//                tabBar.alpha = 0
////                tabBar.transform = CGAffineTransform(translationX: 0, y: 16)
//            } else {
//                // ✅ pop 成功：回到有 tabBar 的页面
//                tabBar.alpha = 1
////                tabBar.transform = .identity
//            }
//        }
//    }

    // MARK: - push / pop 时自动管理 tabBar
//    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
//        // 二级页面一开始就隐藏 tabBar
//        if viewControllers.count >= 1 {
//            self.tabBarController?.setTabBarHidden(true, animated: true)
//        }else {
//            self.tabBarController?.setTabBarHidden(false, animated: true)
//        }
//        super.pushViewController(viewController, animated: animated)
//    }
//    
    
    
//
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//
//        // 根控制器禁止侧滑
//        if viewControllers.count <= 1 {
//            return false
//        }
//
//
//        return true
//    }
//    
//    func easeOut(_ x: CGFloat) -> CGFloat {
//        return 1 - pow(1 - x, 3)
//    }
//    
//    @objc private func handlePopGesture(_ gesture: UIScreenEdgePanGestureRecognizer) {
//
//        let translationX = gesture.translation(in: gesture.view).x
//        let screenWidth = UIScreen.main.bounds.width
//
//        var progress = translationX / screenWidth
//        progress = min(max(progress, 0), 1)
//
//        // 🔒 锁最大进度（关键）
//        maxProgress = max(maxProgress, progress)
//
//        guard let tabBar = tabBarController?.tabBar else { return }
//
//        // 👉 跟手阶段：只做视觉，不做判断
////
//        let visualProgress = min(maxProgress / visualThreshold, 1)
//        
//        
//        tabBar.alpha = visualProgress
//            // ❌ 不在这里决定最终状态
//            if gesture.state == .ended || gesture.state == .cancelled {
//                maxProgress = 0
//            }
//        }
}
