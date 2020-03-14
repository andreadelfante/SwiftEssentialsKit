//
//  Package.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 18/02/2020.
//

import Foundation

/// This is a DTO to transfer data between controllers.
public final class Package {
    /// The action, useful to configure properly the destination controller.
    public private(set) var action: AnyHashable?
    private var arguments: [AnyHashable: Any]

    /// Create a new Package with no data.
    /// - Parameter action: the action to configure properly the destination controller.
    public init(action: AnyHashable? = nil) {
        self.action = action
        self.arguments = [:]
    }

    public subscript<T>(key: AnyHashable) -> T? {
        get { return get(key: key) }
        set { put(key: key, element: newValue) }
    }

    public subscript<T>(key: AnyHashable, defaultValue: T) -> T {
        return get(key: key, defaultValue: defaultValue)
    }

    /// Insert a data in this package, with an associated key.
    /// - Parameters:
    ///   - key: the associated key to get the element on the other side.
    ///   - element: the element to transfer.
    /// - Returns: Self for chaining.
    @discardableResult
    public func put<T>(key: AnyHashable, element: T?) -> Self {
        if let element = element {
            arguments[key] = element
        }
        return self
    }

    /// Get the element with an associated key.
    /// - Parameter key: the associated key.
    /// - Returns: the element.
    public func get<T>(key: AnyHashable) -> T? {
        guard let element = arguments[key] else { return nil }
        return element as? T
    }

    /// Get the element with an associated key. If the element is not present in this package, this function returns the default value.
    /// - Parameters:
    ///   - key: the associated key
    ///   - defaultValue: the default value if the key is not present in this package.
    /// - Returns: the element or the defaultValue if none.
    public func get<T>(key: AnyHashable, defaultValue: T) -> T {
        return get(key: key) ?? defaultValue
    }
}

extension Package: NSCopying {
    public func copy(with zone: NSZone? = nil) -> Any {
        let package = Package(action: action)
        package.arguments = arguments
        return package
    }
}

extension Package: Equatable {
    public static func ==(lhs: Package, rhs: Package) -> Bool {
        return lhs.action == rhs.action &&
            lhs.arguments.keys == rhs.arguments.keys
    }
}

extension Package: CustomStringConvertible, CustomDebugStringConvertible {
    public var debugDescription: String {
        return "Package { action = \(String(describing: action)), arguments = \(arguments) }"
    }

    public var description: String {
        return debugDescription
    }
}
