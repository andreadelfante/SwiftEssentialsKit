//
//  InfoTests.swift
//  SwiftEssentialsKit_Tests
//
//  Created by Andrea Del Fante on 03/03/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
#if SWIFT_PACKAGE
import SwiftEssentialsKit_Convenient
#else
import SwiftEssentialsKit
#endif

class InfoTests: XCTestCase {
    private var bundle: Bundle!
    private var info: Info!
    
    override func setUp() {
        super.setUp()
        
        bundle = Bundle(for: InfoTests.self)
        info = Info(bundle: bundle)
    }
    
    func testVersion() {
        XCTAssertEqual(info.version, "1.0")
    }
    
    func testBuild() {
        XCTAssertEqual(info.build, "1")
    }
    
    func testBundleIdentifier() {
        XCTAssertEqual(info.bundleIdentifier, "org.cocoapods.SwiftEssentialsKit-Tests")
    }
    
    func testDisplayName() {
        XCTAssertEqual(info.displayName, "SwiftEssentialsKit-Tests")
    }
    
    func testIsInitialStatusBarHidden() {
        XCTAssertEqual(info.isInitiallyStatusBarHidden, true)
    }
    
    #if canImport(UIKit)
    func testStatusBarStyle() {
        XCTAssertNotNil(info.statusBarStyle)
    }
    #endif
}
