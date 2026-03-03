//
//  HomeDependencies.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

public protocol HomeDependenciesProtocol {
    var userService: UserServiceProtocol { get }
    var analyticsService: AnalyticsServiceProtocol { get }
}
