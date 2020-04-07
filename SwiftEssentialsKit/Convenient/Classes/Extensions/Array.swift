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
        return binarySearch {
            if element == $0 {
                return .orderedSame
            } else if element < $0 {
                return .orderedAscending
            } else {
                return .orderedDescending
            }
        }
    }
}

extension Array {
    
    /// Perform a binary search to find the index of the element.
    /// Binary search is useful to find an element in a **sorted** array.
    /// Complexity: **O(log n)**
    ///
    /// - Parameter where: the comparison criteria.
    /// - Returns: the index of the found element.
    public func binarySearch(where: (Element) -> ComparisonResult) -> Index? {
        var startIndex = 0
        var endIndex = count - 1
        
        while startIndex <= endIndex {
            let middleIndex = (startIndex + endIndex) / 2
            let comparisonResult = `where`(self[middleIndex])
            
            if comparisonResult == .orderedSame {
                return middleIndex
            } else if comparisonResult == .orderedAscending {
                endIndex = middleIndex - 1
            } else {
                startIndex = middleIndex + 1
            }
        }
        
        return nil
    }
}
