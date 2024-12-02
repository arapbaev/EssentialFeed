//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Aslan Arapbaev on 12/1/24.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (Error?, HTTPURLResponse?) -> Void)
}

public final class RemoteFeedLoader {
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    let url: URL
    let cliet: HTTPClient
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.cliet = client
    }
    
    public func load(completion: @escaping (Error) -> Void) {
        cliet.get(from: url) { error, response in
            if response != nil {
                completion(.invalidData)
            } else {
                completion(.connectivity)
            }
        }
    }
}
