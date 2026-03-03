//
//  DefaultUserService.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

final class DefaultUserService: UserServiceProtocol {

    private var userName: String?

    init() {
        // 模拟登录
        self.userName = "ptlCoder"
    }

    func currentUserName() -> String {
        userName ?? "Guest"
    }

    func isLoggedIn() -> Bool {
        userName != nil
    }
}
