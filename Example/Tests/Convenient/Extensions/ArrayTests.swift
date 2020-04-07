//
//  ArrayTests.swift
//  SwiftEssentialsKit_Tests
//
//  Created by Andrea Del Fante on 21/02/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import Fakery
#if SWIFT_PACKAGE
import SwiftEssentialsKit_Convenient
#else
import SwiftEssentialsKit
#endif

class ArrayTests: XCTestCase {
    private let faker = Faker()
    
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
    
    func testBinarySearchElement() {
        let manyElements = Array(0...50)
        XCTAssertNil(manyElements.binarySearch(for: -1))
        XCTAssertNil(manyElements.binarySearch(for: 51))
        
        manyElements.forEach { (element) in
            XCTAssertEqual(manyElements.binarySearch(for: element), manyElements.firstIndex(of: element))
        }
    }
    
    func testBinarySearchWhere() {
        let manyElements = Array(0...5)
            .map { _ in faker.lorem.word() }
            .sorted()
        
        XCTAssertNil(manyElements.binarySearch(where: { _ in .orderedAscending }))
        XCTAssertNil(manyElements.binarySearch(where: { _ in .orderedDescending }))
        
        manyElements.forEach { (element) in
            XCTAssertEqual(manyElements.binarySearch(where: { element.compare($0) }),
                           manyElements.firstIndex(where: { element == $0 }))
        }
    }
}
