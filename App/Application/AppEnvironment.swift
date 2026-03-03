//
//  AppEnvironment.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

class AppEnvironment {
    
    static let shared = AppEnvironment()
    
    let services: Services
    let moduleRegistry: ModuleRegistry // 模块注册表
    let router: AppRouter // 路由

    init() {
        self.services = Services()
        self.moduleRegistry = ModuleRegistry()
        self.router = AppRouter(moduleRegistry: moduleRegistry)
    }
}

extension AppEnvironment: HomeDependenciesProtocol {
    var userService: UserServiceProtocol {
        services.userService
    }

    var analyticsService: AnalyticsServiceProtocol {
        services.analyticsService
    }
}
