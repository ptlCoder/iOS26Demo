//
//  DefaultLogger.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//
//以后可以接：
//OSLog
//文件日志
//远程日志系统
import UIKit

public final class DefaultLogger: Logger {

    public init() {}

    public func log(_ message: String) {
        #if DEBUG
        print("🪵", message)
        #endif
    }
}
