//
//  UIRefreshControl+TestHelpers.swift
//  EssentialFeed
//
//  Created by Aslan Arapbaev on 1/7/25.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        simulate(event: .valueChanged)
    }
}
