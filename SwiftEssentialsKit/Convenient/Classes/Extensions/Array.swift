//
//  Array.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 21/02/2020.
//

import Foundation

extension Array where Element == String {

    /// Join this array of strings with new line separator.
    public func joinedWithNewLine() -> String {
        return joined(separator: "\n")
    }

    /// Join this array of strings with space separator.
    public func joinedWithSpace() -> String {
        return joined(separator: " ")
    }
}
