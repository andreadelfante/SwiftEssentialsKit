//
//  HideableAlert.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 19/02/2020.
//

import Foundation

/// A  protocol to define functions for hideable alert.
public protocol HideableAlert {
    typealias HideCompletion = () -> Void

    /// Dismiss this alert.
    /// - Parameters:
    ///   - animated: dismiss with animation.
    ///   - completion: completion after completed dismissing.
    func hide(animated: Bool, completion: HideCompletion?)
}

extension HideableAlert {

    /// Dismiss this alert.
    /// - Parameters:
    ///   - animated: dismiss with animation.
    public func hide(animated: Bool = true) {
        hide(animated: animated, completion: nil)
    }
}
