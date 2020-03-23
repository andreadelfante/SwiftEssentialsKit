//
//  String.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 21/02/2020.
//

import Foundation

extension String {

    /// Remove from this string whitespaces and new lines.
    public var trimmed: String {
        return trimmingCharacters(
            in: CharacterSet.whitespacesAndNewlines
        )
    }
    
    /// Returns an array containing all elements splitting by the separator.
    /// - Parameter separator: the separator key.
    public func split(separator: String) -> [String] {
        return components(separatedBy: separator)
    }
}

extension String {

    /// This string as integer.
    public var asInt: Int? {
        return Int(self)
    }

    /// This string as float.
    public var asFloat: Float? {
        return Float(self)
    }

    /// This string as double.
    public var asDouble: Double? {
        return Double(self)
    }
}

// MARK: Renamed

extension String {
    @available(*, renamed: "trimmed", message: "This will be removed in future release.")
    public var trim: String {
        return trimmed
    }
}
