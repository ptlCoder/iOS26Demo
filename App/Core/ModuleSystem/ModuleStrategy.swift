//
//  ModuleStrategy.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//
//虽然 Home 用自定义 Strategy，但这是未来统一版本策略入口。
public protocol ModuleStrategy {
    associatedtype ModuleType
    func makeModule() -> ModuleType
}
