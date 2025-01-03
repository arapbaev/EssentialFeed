//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Aslan Arapbaev on 12/18/24.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
