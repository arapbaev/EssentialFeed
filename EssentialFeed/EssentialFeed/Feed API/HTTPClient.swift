//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Aslan Arapbaev on 12/7/24.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
