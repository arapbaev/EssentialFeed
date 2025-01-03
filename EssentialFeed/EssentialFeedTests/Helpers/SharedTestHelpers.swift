//
//  SharedTestHelpers.swift
//  EssentialFeed
//
//  Created by Aslan Arapbaev on 12/23/24.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "https://any-url.com")!
}
