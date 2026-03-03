//
//  AppBootstrap.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

class AppBootstrap {
    static func setup(env: AppEnvironment) {
        // 注册模块表
        env.moduleRegistry.register(HomeModuleProtocol.self) {
            // 首页策略
            HomeStrategy(featureFlagService: env.services.featureFlagService, dependencies: env).makeModule()
        }
        
//        env.moduleRegistry.register(ProfileModuleProtocol.self) {
//            // 首页策略
//            let strategy = HomeStrategy(
//                featureFlag: env.services.featureFlagService,
//                dependencies: env
//            )
//            return strategy.makeModule()
//        }
    }
}
