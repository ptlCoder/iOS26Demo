//
//  DefaultFeatureFlagService.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//


final class DefaultFeatureFlagService: FeatureFlagServiceProtocol {

    private var flags: [Feature: Bool] = [:]

    init() {
        loadLocalFlags()
    }

    private func loadLocalFlags() {

        #if DEBUG
        flags[.newHome] = true
        #else
        flags[.newHome] = false
        #endif
    }

    func isEnabled(_ feature: Feature) -> Bool {
        flags[feature] ?? false
    }
}
