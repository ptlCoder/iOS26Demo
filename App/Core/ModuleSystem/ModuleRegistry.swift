//
//  ModuleRegistry.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//
//为什么加锁？
//防止并发 resolve/register 崩溃
//企业项目必须考虑线程安全

import UIKit

public final class ModuleRegistry {

    private var factories: [ObjectIdentifier: () -> Any] = [:]
    private let lock = NSLock()

    public init() {}

    public func register<T>(_ type: T.Type,
                            factory: @escaping () -> T) {

        lock.lock()
        defer { lock.unlock() }

        let key = ObjectIdentifier(type)

        guard factories[key] == nil else {
            fatalError("Module already registered: \(type)")
        }

        factories[key] = factory
    }

    public func resolve<T>(_ type: T.Type) -> T {

        lock.lock()
        defer { lock.unlock() }

        let key = ObjectIdentifier(type)

        guard let factory = factories[key],
              let module = factory() as? T else {
            fatalError("Module not registered: \(type)")
        }

        return module
    }

    public func isRegistered<T>(_ type: T.Type) -> Bool {
        factories[ObjectIdentifier(type)] != nil
    }
}
