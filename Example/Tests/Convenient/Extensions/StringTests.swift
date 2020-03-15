//
//  StringTests.swift
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

class StringTests: XCTestCase {
    
    func testTrimmed() {
        XCTAssertEqual("".trimmed, "")
        XCTAssertEqual(" ".trimmed, "")
        XCTAssertEqual(" hi".trimmed, "hi")
        XCTAssertEqual("you ".trimmed, "you")
        XCTAssertEqual(" good ".trimmed, "good")
    }
    
    func testAsInt() {
        XCTAssertNil("".asInt)
        XCTAssertNil("hi".asInt)
        XCTAssertNil(" ".asInt)
        XCTAssertEqual("12".asInt, 12)
        XCTAssertEqual("21".asInt, 21)
        XCTAssertEqual("012".asInt, 12)
        XCTAssertEqual("210".asInt, 210)
        XCTAssertNil(" 12".asInt)
        XCTAssertNil("21 ".asInt)
        XCTAssertNil("12 21".asInt)
    }
    
    func testAsFloat() {
        XCTAssertNil("".asFloat)
        XCTAssertNil("hi".asFloat)
        XCTAssertNil(" ".asFloat)
        XCTAssertEqual("12".asFloat, 12.0)
        XCTAssertEqual("21".asFloat, 21.0)
        XCTAssertEqual("012".asFloat, 12)
        XCTAssertEqual("210".asFloat, 210)
        XCTAssertNil(" 12".asFloat)
        XCTAssertNil("21 ".asFloat)
        XCTAssertNil("12 21".asFloat)
    }
    
    func testAsDouble() {
        XCTAssertNil("".asDouble)
        XCTAssertNil("hi".asDouble)
        XCTAssertNil(" ".asDouble)
        XCTAssertEqual("12".asDouble, 12.0)
        XCTAssertEqual("21".asDouble, 21.0)
        XCTAssertEqual("012".asDouble, 12)
        XCTAssertEqual("210".asDouble, 210)
        XCTAssertNil(" 12".asDouble)
        XCTAssertNil("21 ".asDouble)
        XCTAssertNil("12 21".asDouble)
    }
    
    // MARK: Renamed
    
    func testTrim() {
        XCTAssertEqual("".trimmed, "".trim)
        XCTAssertEqual(" ".trimmed, "".trim)
        XCTAssertEqual(" hi".trimmed, "hi".trim)
        XCTAssertEqual("you ".trimmed, "you".trim)
        XCTAssertEqual(" good ".trimmed, "good".trim)
    }
}
