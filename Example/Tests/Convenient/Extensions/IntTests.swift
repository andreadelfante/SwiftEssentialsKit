//
//  IntTests.swift
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

class IntTests: XCTestCase {
    
    func testAsString() {
        XCTAssertEqual(0.asString, "0")
        XCTAssertEqual(17.asString, "17")
    }
}
