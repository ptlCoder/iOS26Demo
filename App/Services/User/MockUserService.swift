//
//  MockUserService.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

final class MockUserService: UserServiceProtocol {
    func currentUserName() -> String { "TestUser" }
    func isLoggedIn() -> Bool { true }
}
