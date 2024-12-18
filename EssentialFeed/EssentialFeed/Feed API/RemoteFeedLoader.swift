//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Aslan Arapbaev on 12/1/24.
//

import Foundation

public final class RemoteFeedLoader: FeedLoader {
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public typealias Result = LoadFeedResult
    
    let url: URL
    let cliet: HTTPClient
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.cliet = client
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        cliet.get(from: url) { [weak self] result in
            guard self != nil else { return }
            
            switch result {
                case let .success(data, response):
                    completion(RemoteFeedLoader.map(data, from: response))
                case .failure:
                    completion(.failure(Error.connectivity))
            }
        }
    }
    
    private static func map(_ data: Data, from response: HTTPURLResponse) -> Result {
        do {
            let items = try FeedItemsMapper.map(data, from: response)
            return .success(items.toModels())
        } catch {
            return .failure(error)
        }
    }
}

private extension Array where Element == RemoteFeedItem {
    func toModels() -> [FeedItem] {
        return map { FeedItem(id: $0.id, description: $0.description, location: $0.location, imageURL: $0.image) }
    }
}
