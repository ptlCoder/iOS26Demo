//
//  HomeV1Assembly.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

import UIKit
import SwiftUI

final class HomeV1Assembly: HomeModuleProtocol {
    
    private let dependencies: HomeDependenciesProtocol

    init(dependencies: HomeDependenciesProtocol) {
        self.dependencies = dependencies
    }

    func makePage() -> UIViewController {

        let viewModel = HomeViewModel(
            userService: dependencies.userService,
            analytics: dependencies.analyticsService
        )

        let view = HomeSwiftUIView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
