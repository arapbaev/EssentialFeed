//
//  UIButton+TestHelpers.swift
//  EssentialFeed
//
//  Created by Aslan Arapbaev on 1/7/25.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
