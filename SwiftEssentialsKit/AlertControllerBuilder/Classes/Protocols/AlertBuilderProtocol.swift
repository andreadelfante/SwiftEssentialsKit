//
//  AlertBuilderProtocol.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 19/02/2020.
//

import Foundation

/// A generic protocol to define common alert building functions.
public protocol AlertBuilderProtocol {
    typealias ActionBuilder = () -> UIAlertAction
    typealias ActionHandler = (UIAlertAction) -> Void
    typealias ShowCompletion = () -> Void

    /// Specify a title for the alert.
    /// - Parameter title: the title.
    /// - Returns: self for chaining.
    func title(_ title: String) -> Self

    /// Specify a message for the alert.
    /// - Parameter message: the message.
    /// - Returns: self for chaining.
    func message(_ message: String) -> Self

    /// Add an action to the alert.
    /// - Parameter builder: the builder to create an action.
    /// - Returns: self for chaining.
    func addAction(builder: ActionBuilder) -> Self

    /// Build an UIAlertController.
    /// - Returns: an UIAlertController.
    func build() -> UIAlertController

    /// Show the alert.
    /// - Parameters:
    ///   - context: the controller.
    ///   - animated: showing with animation.
    ///   - completion: completion after completed showing.
    /// - Returns: an hideable alert.
    @discardableResult
    func show(in context: UIViewController, animated: Bool, completion: ShowCompletion?) -> HideableAlert
}

extension AlertBuilderProtocol {

    /// Add an action with default style to the alert.
    /// - Parameters:
    ///   - title: the title of the action.
    ///   - handler: the callback when selecting it.
    /// - Returns: self for chaining.
    public func addAction(defaultType title: String, handler: ActionHandler? = nil) -> Self {
        return addAction {
            UIAlertAction(title: title,
                          style: .default,
                          handler: handler)
        }
    }

    /// Add an action with destructive style to the alert.
    /// - Parameters:
    ///   - title: the title of the action.
    ///   - handler: the callback when selecting it.
    /// - Returns: self for chaining.
    public func addAction(destructiveType title: String, handler: ActionHandler? = nil) -> Self {
        return addAction {
            UIAlertAction(title: title,
                          style: .destructive,
                          handler: handler)
        }
    }

    /// Add an action with cancel style to the alert.
    /// - Parameters:
    ///   - title: the title of the action.
    ///   - handler: the callback when selecting it.
    /// - Returns: self for chaining.
    public func addAction(cancelType title: String, handler: ActionHandler? = nil) -> Self {
        return addAction {
            UIAlertAction(title: title,
                          style: .cancel,
                          handler: handler)
        }
    }
}

extension AlertBuilderProtocol {

    /// Show the alert with animation and no completion.
    /// - Parameters:
    ///   - context: the controller.
    /// - Returns: an hideable alert.
    @discardableResult
    public func show(in context: UIViewController) -> HideableAlert {
        return show(in: context, animated: true)
    }

    /// Show the alert with no completion.
    /// - Parameters:
    ///   - context: the controller.
    ///   - animated: showing with animation.
    /// - Returns: an hideable alert.
    @discardableResult
    public func show(in context: UIViewController, animated: Bool) -> HideableAlert {
        return show(in: context, animated: animated, completion: nil)
    }
}
