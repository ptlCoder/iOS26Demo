//
//  BaseStrategy.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

class BaseStrategy<Module: Any> : ModuleStrategy {

    typealias ModuleType = Module

    let featureFlagService: FeatureFlagServiceProtocol
    let dependencies: HomeDependenciesProtocol
    
    init(featureFlagService: FeatureFlagServiceProtocol,
         dependencies: HomeDependenciesProtocol) {
        
        self.featureFlagService = featureFlagService
        self.dependencies = dependencies
    }

    func makeModule() -> ModuleType {
        fatalError("子类必须 override makeModule()")
    }
}
