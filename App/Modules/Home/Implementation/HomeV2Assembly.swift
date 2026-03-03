//
//  HomeV2Assembly.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

import UIKit

final class HomeV2Assembly: HomeModuleProtocol {
    
    private let dependencies: HomeDependenciesProtocol

    init(dependencies: HomeDependenciesProtocol) {
        self.dependencies = dependencies
    }
    
    func makePage() -> UIViewController {
        let vc = HomeViewController()
        return vc
    }
}
