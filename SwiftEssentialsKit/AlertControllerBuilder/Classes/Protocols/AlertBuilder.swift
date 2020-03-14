//
//  AlertBuilder.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 19/02/2020.
//

import UIKit

/// A  protocol to define functions for sheet.
public protocol AlertBuilder: AlertBuilderProtocol {
    typealias TextFieldBuilder = (UITextField) -> Void
    typealias ActionValuesHandler = (_ action: UIAlertAction, _ values: [String: String]) -> Void
    typealias ValidatorBlock = (_ values: [String: String]) -> Bool

    /// Add an action with default style to the alert.
    /// - Parameters:
    ///   - title: the title of the action.
    ///   - validate: this closure return true if this action is enabled, false otherwise.
    ///   - handler: the callback when selecting it.
    /// - Returns: self for chaining.
    func addAction(defaultType title: String, validate: @escaping ValidatorBlock, handler: @escaping Self.ActionValuesHandler) -> Self

    /// Add an action with cancel style to the alert.
    /// - Parameters:
    ///   - title: the title of the action.
    ///   - validate: this closure return true if this action is enabled, false otherwise.
    ///   - handler: the callback when selecting it.
    /// - Returns: self for chaining.
    func addAction(cancelType title: String, validate: @escaping ValidatorBlock, handler: @escaping Self.ActionValuesHandler) -> Self

    /// Add an action with destructive style to the alert.
    /// - Parameters:
    ///   - title: the title of the action.
    ///   - validate: this closure return true if this action is enabled, false otherwise.
    ///   - handler: the callback when selecting it.
    /// - Returns: self for chaining.
    func addAction(destructiveType title: String, validate: @escaping ValidatorBlock, handler: @escaping Self.ActionValuesHandler) -> Self

    /// Add a text field to the alert.
    /// - Parameters:
    ///   - key: the associated key to retrieve the value from this text field.
    ///   - configuration: the text field configuration.
    /// - Returns: self for chaining.
    func add(textField key: String, configuration: @escaping TextFieldBuilder) -> Self
}

extension AlertBuilder {
    /// Add an action with default style to the alert.
    /// - Parameters:
    ///   - title: the title of the action.
    ///   - handler: the callback when selecting it.
    public func addAction(defaultType title: String, handler: @escaping Self.ActionValuesHandler) -> Self {
        return addAction(defaultType: title,
                         validate: { (_) in return true },
                         handler: handler)
    }

    /// Add an action with cancel style to the alert.
    /// - Parameters:
    ///   - title: the title of the action.
    ///   - handler: the callback when selecting it.
    public func addAction(cancelType title: String, handler: @escaping Self.ActionValuesHandler) -> Self {
        return addAction(cancelType: title,
                         validate: { (_) in return true },
                         handler: handler)
    }

    /// Add an action with destructive style to the alert.
    /// - Parameters:
    ///   - title: the title of the action.
    ///   - handler: the callback when selecting it.
    public func addAction(destructiveType title: String, handler: @escaping Self.ActionValuesHandler) -> Self {
        return addAction(destructiveType: title,
                         validate: { (_) in return true },
                         handler: handler)
    }

    /// Add a text field to the alert.
    /// - Parameters:
    ///   - key: the associated key to retrieve the value from this text field.
    /// - Returns: self for chaining.
    public func add(textField key: String) -> Self {
        return add(textField: key, configuration: { (_) in })
    }
}
