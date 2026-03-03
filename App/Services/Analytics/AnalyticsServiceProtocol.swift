//
//  AnalyticsService.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

public protocol AnalyticsServiceProtocol {
    func track(event: String, parameters: [String: Any]?)
}
