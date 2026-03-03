//
//  Services.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

final class Services {

    let userService: UserServiceProtocol
    let analyticsService: AnalyticsServiceProtocol
    let featureFlagService: FeatureFlagServiceProtocol

    init() {
        self.userService = DefaultUserService()
        self.analyticsService = DefaultAnalyticsService()
        self.featureFlagService = DefaultFeatureFlagService()
    }
}
