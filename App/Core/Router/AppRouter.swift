//
//  AppRouter.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

import UIKit

public final class AppRouter {

    private var navigationController: UINavigationController?
    private let moduleRegistry: ModuleRegistry

    public init(moduleRegistry: ModuleRegistry) {
        self.moduleRegistry = moduleRegistry
    }

    // MARK: - Public Navigation

    public func navigate(to route: Route, in navigationController : UINavigationController?, animated: Bool = true) {
        self.navigationController = navigationController
        
        switch route {

        case .home:
            let module = moduleRegistry.resolve(HomeModuleProtocol.self)
            push(module.makePage(), animated: animated)

        case .profile(let userID):
            let module = moduleRegistry.resolve(ProfileModuleProtocol.self)
            push(module.makeProfilePage(userID: userID), animated: animated)

        case .custom(let vc):
            push(vc, animated: animated)
        }
    }

    public func push(_ vc: UIViewController, animated: Bool) {
        navigationController?.pushViewController(vc, animated: animated)
    }

    public func present(_ vc: UIViewController, animated: Bool) {
        navigationController?.present(vc, animated: animated)
    }

    public func pop(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
}

extension AppRouter {
    func goHome(in nav: UINavigationController?) {
        navigate(to: .home, in: nav)
    }
}
