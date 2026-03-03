//
//  Route.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

import UIKit

public enum Route {
    case home
    case profile(userID: String)
    case custom(UIViewController)
}
