//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Aslan Arapbaev on 12/18/24.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
