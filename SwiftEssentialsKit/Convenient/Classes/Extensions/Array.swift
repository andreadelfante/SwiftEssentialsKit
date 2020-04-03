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

extension Array where Element: Comparable {
    
    /// Perform a binary search to find the index of the element.
    /// Binary search is useful to find an element in a **sorted** array.
    /// Complexity: **O(log n)**
    ///
    /// - Parameter element: the element to find.
    /// - Returns: the index of the found element.
    public func binarySearch(for element: Element) -> Index? {
        var startIndex = 0
        var endIndex = count - 1
        
        while startIndex <= endIndex {
            let middleIndex = (startIndex + endIndex) / 2
            
            if self[middleIndex] > element {
                endIndex = middleIndex - 1
            } else if self[middleIndex] < element {
                startIndex = middleIndex + 1
            } else {
                return middleIndex
            }
        }
        
        return nil
    }
}
