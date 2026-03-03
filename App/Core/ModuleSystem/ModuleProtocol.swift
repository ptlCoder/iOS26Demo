//
//  Module.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

import UIKit

/// 所有模块都遵循 ModuleProtocol
public protocol ModuleProtocol {
    /// 返回模块入口的 UIViewController / SwiftUI HostingController
    func makePage() -> UIViewController
}
