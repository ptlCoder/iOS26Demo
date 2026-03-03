//
//  HomeStrategy.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

import UIKit

class HomeModuleV1: HomeModuleProtocol {
    func makePage() -> UIViewController {
        return HomeV1Assembly(dependencies: AppEnvironment.shared).makePage()
    }
}

class HomeModuleV2: HomeModuleProtocol {
    func makePage() -> UIViewController {
        return HomeV2Assembly(dependencies: AppEnvironment.shared).makePage()
    }
}


class HomeStrategy: BaseStrategy<HomeModuleProtocol> {

    override func makeModule() -> HomeModuleProtocol {
        if featureFlagService.isEnabled(.newProfile) {
            return HomeModuleV1()
        } else {
            return HomeModuleV2()
        }
    }
}


