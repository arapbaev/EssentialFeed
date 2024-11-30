//
//  RemoteFeedLoaderTests.swift
//  EssentialFeed
//
//  Created by Aslan Arapbaev on 11/30/24.
//

import XCTest

class RemoteFeedLoader {
    let cliet: HTTPClient
    
    init(client: HTTPClient) {
        self.cliet = client
    }
    
    func load() {
        cliet.get(from: URL(string: "https://example.com")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesnotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        let client = HTTPClientSpy()
        let loader = RemoteFeedLoader(client: client)
        
        loader.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
    
}
