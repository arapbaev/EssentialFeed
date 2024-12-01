//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Aslan Arapbaev on 12/1/24.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL)
}

public final class RemoteFeedLoader {
    let url: URL
    let cliet: HTTPClient
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.cliet = client
    }
    
    public func load() {
        cliet.get(from: url)
    }
}
