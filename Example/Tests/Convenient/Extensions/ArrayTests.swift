//
//  ArrayTests.swift
//  SwiftEssentialsKit_Tests
//
//  Created by Andrea Del Fante on 21/02/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
#if SWIFT_PACKAGE
import SwiftEssentialsKit_Convenient
#else
import SwiftEssentialsKit
#endif

class ArrayTests: XCTestCase {
    
    func testJoinedWithNewLine() {
        let array = ["hi", "all", "moarning"]
        let expected = "hi\nall\nmoarning"
        
        XCTAssertEqual(array.joinedWithNewLine(), expected)
    }
    
    func testJoinedWithSpace() {
        let array = ["hi", "all", "moarning"]
        let expected = "hi all moarning"
        
        XCTAssertEqual(array.joinedWithSpace(), expected)
    }
    
    func testBinarySearch() {
        XCTAssertNil([Int]().binarySearch(for: 1))
        
        let oneElement = [1]
        XCTAssertEqual(oneElement.binarySearch(for: 1), oneElement.startIndex)
        XCTAssertNil(oneElement.binarySearch(for: 0))
        
        let manyElements = [1, 2, 3, 4, 5, 6, 7]
        XCTAssertEqual(manyElements.binarySearch(for: 1), 0)
        XCTAssertEqual(manyElements.binarySearch(for: 7), manyElements.count - 1)
        XCTAssertEqual(manyElements.binarySearch(for: 4), manyElements.count / 2)
        XCTAssertEqual(manyElements.binarySearch(for: 2), 1)
        XCTAssertEqual(manyElements.binarySearch(for: 6), manyElements.count - 2)
        XCTAssertNil(manyElements.binarySearch(for: 0))
        XCTAssertNil(manyElements.binarySearch(for: 8))
    }
}
