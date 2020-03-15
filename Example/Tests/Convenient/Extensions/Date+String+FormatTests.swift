//
//  Date+String+FormatTests.swift
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

class DateStringFormatTests: XCTestCase {
    private let faker = Faker()
    private var patterns: [DateFormatPattern]!
    private var dates: [Date]!
    
    override func setUp() {
        super.setUp()
        
        patterns = DateFormatPattern.allCases
        dates = [
            Date(),
            faker.date.forward(12),
            faker.date.backward(days: 12)
        ]
    }
    
    func testString() {
        dates.forEach { (date) in
            patterns.forEach { (pattern) in
                let formatter = DateFormatter()
                formatter.dateFormat = pattern.rawValue
                formatter.timeZone = TimeZone.current
                formatter.locale = Locale.current
                
                XCTAssertEqual(date.string(pattern),
                               formatter.string(from: date))
            }
        }
    }
    
    func testDate() {
        dates.forEach { (date) in
            patterns.forEach { (pattern) in
                let formatter = DateFormatter()
                formatter.dateFormat = pattern.rawValue
                formatter.timeZone = TimeZone.current
                formatter.locale = Locale.current
                
                XCTAssertEqual(date.string(pattern).date(pattern),
                               formatter.date(from: formatter.string(from: date)))
            }
        }
    }
}
