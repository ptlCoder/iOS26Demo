//
//  NetworkClient.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

import UIKit


public protocol NetworkClient {
    func request(_ endpoint: URL,
                 completion: @escaping (Result<Data, Error>) -> Void)
}


