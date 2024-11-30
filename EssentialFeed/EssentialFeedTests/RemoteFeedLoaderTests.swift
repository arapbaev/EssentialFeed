//
//  RemoteFeedLoaderTests.swift
//  EssentialFeed
//
//  Created by Aslan Arapbaev on 11/30/24.
//

import XCTest

class RemoteFeedLoader {
    let cliet: HTTPClient
    let url: URL
    
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.cliet = client
    }
    
    func load() {
        cliet.get(from: url)
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
        let url = URL(string: "https://exampleA.com")!
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(url: url, client: client)
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        let url = URL(string: "https://exampleB.com")!
        let client = HTTPClientSpy()
        let loader = RemoteFeedLoader(url: url, client: client)
        
        loader.load()
        
        XCTAssertEqual(client.requestedURL, url)
    }
    
}
