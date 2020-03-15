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
}
