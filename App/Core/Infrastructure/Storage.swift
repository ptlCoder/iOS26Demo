//
//  Storage.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

import UIKit

public protocol Storage {
    func set(_ value: Any?, forKey key: String)
    func value(forKey key: String) -> Any?
}
