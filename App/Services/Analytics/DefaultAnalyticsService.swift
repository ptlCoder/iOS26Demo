//
//  DefaultAnalyticsService.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//


final class DefaultAnalyticsService: AnalyticsServiceProtocol {

    func track(event: String, parameters: [String: Any]? = nil) {
        #if DEBUG
        print("📊 Event:", event, parameters ?? [:])
        #endif

        // 未来接入：
        // Firebase
        // 自建埋点系统
        // Mixpanel
    }
}
