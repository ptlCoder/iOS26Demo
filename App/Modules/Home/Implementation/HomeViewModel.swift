//
//  HomeViewModel.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

import UIKit
import Combine

class HomeViewModel: ObservableObject {
    private let userService: UserServiceProtocol
    private let analytics: AnalyticsServiceProtocol
    
    @Published var username: String = ""
    
    init(userService: UserServiceProtocol,
         analytics: AnalyticsServiceProtocol) {
        self.userService = userService
        self.analytics = analytics
    }

    func load() {
        username = userService.currentUserName()
        analytics.track(event: "home_loaded", parameters: ["id": 123456])
    }

}
