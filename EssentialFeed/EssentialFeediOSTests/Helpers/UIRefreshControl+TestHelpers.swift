//
//  UIRefreshControl+TestHelpers.swift
//  EssentialFeed
//
//  Created by Aslan Arapbaev on 1/7/25.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .valueChanged)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
