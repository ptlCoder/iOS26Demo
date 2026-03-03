//
//  DefaultNetworkClient.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//
//以后可升级：
//Combine
//async/await
//Token 注入
//Interceptor
//Retry
//Metrics
//接口不变。
import UIKit

public final class DefaultNetworkClient: NetworkClient {

    public init() {}

    public func request(_ endpoint: URL,
                        completion: @escaping (Result<Data, Error>) -> Void) {

        URLSession.shared.dataTask(with: endpoint) { data, _, error in

            if let error = error {
                completion(.failure(error))
                return
            }

            completion(.success(data ?? Data()))
        }
        .resume()
    }
}
