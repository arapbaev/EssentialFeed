//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Aslan Arapbaev on 12/1/24.
//

import Foundation

public final class RemoteFeedLoader {
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public enum Result: Equatable {
        case success([FeedItem])
        case failure(Error)
    }
    
    let url: URL
    let cliet: HTTPClient
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.cliet = client
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        cliet.get(from: url) { result in
            switch result {
                case let .success(data, response):
                    completion(FeedItemsMapper.map(data, from: response))
                case .failure:
                    completion(.failure(.connectivity))
            }
        }
    }
}
