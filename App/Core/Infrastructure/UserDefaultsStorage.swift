//
//  UserDefaultsStorage.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//
//以后可替换：
//Keychain
//SQLite
//Realm
//File system


import UIKit

public final class UserDefaultsStorage: Storage {

    private let defaults = UserDefaults.standard

    public init() {}

    public func set(_ value: Any?, forKey key: String) {
        defaults.set(value, forKey: key)
    }

    public func value(forKey key: String) -> Any? {
        defaults.value(forKey: key)
    }
}
