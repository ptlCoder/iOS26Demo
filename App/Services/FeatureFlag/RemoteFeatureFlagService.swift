//
//  RemoteFeatureFlagService.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

final class RemoteFeatureFlagService: FeatureFlagServiceProtocol {

    private var localFlags: [Feature: Bool] = [:]
    private var remoteFlags: [Feature: Bool] = [:]

    func updateRemoteFlags(_ flags: [Feature: Bool]) {
        remoteFlags = flags
    }

    func isEnabled(_ feature: Feature) -> Bool {

        if let remote = remoteFlags[feature] {
            return remote
        }

        return localFlags[feature] ?? false
    }
}
