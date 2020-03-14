//
//  PackageTests.swift
//  SwiftEssentialsKit_Tests
//
//  Created by Andrea Del Fante on 19/02/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import SwiftEssentialsKit
import Fakery

class PackageTests: XCTestCase {
    private var package: Package!
    private let action = "CUSTOM_ACTION"
    private let faker = Faker()
    private var dataSet: [AnyHashable: AnyHashable]!
    
    override func setUp() {
        super.setUp()
        
        package = Package(action: action)
        dataSet = [
            "KEY_STRING": faker.lorem.characters(),
            "KEY_INT": faker.number.randomInt(),
            "KEY_BOOL": faker.number.randomBool(),
            "KEY_FLOAT": faker.number.randomFloat(),
            "KEY_DOUBLE": faker.number.randomDouble(),
            "KEY_DATE": faker.date.birthday(1, 100)
        ]
        
        dataSet.forEach { (key, value) in
            package[key] = value
        }
    }
    
    func testPutAndGet() {
        let nilString: String? = nil
        package["KEY_UNEXISTING"] = nilString
        XCTAssertNil(package["KEY_UNEXISTING"])
        
        dataSet.forEach { (key, expected) in
            let result: AnyHashable = package[key]!
            
            XCTAssertEqual(result, expected)
        }
    }
    
    func testSubscripts() {
        let key = "KEY_INT"
        let unexistingKey = "KEY_UNEXISTING"
        
        var expected: Int = package.get(key: key)!
        XCTAssertEqual(package[key], expected)
        
        package[key] = 2
        expected = package.get(key: key)!
        XCTAssertEqual(package[key], expected)
        
        expected = package.get(key: unexistingKey, defaultValue: 3)
        XCTAssertEqual(package[unexistingKey, 3], expected)
    }
    
    func testCopy() {
        let copiedPackage = package.copy() as? Package
        
        XCTAssertNotNil(copiedPackage)
        XCTAssertEqual(copiedPackage, package)
    }
    
    func testAction() {
        XCTAssertEqual(package.action, action)
    }
}
