//
//  DateTests.swift
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

class DateTests: XCTestCase {
    private let faker = Faker()
    private let calendar = Calendar.current
    private var date: Date!
    private var now: Date!
    
    override func setUp() {
        super.setUp()
        
        date = faker.date.birthday(1, 100)
        now = Date()
    }
    
    func testStartOfDay() {
        let expected = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: date)
        
        XCTAssertEqual(date.startOfDay(calendar: calendar), expected)
    }
    
    func testEndOfDay() {
        let expected = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: date)
        
        XCTAssertEqual(date.endOfDay(calendar: calendar), expected)
    }
    
    func testYesterday() {
        let expected = calendar.date(byAdding: .day, value: -1, to: date)
        
        XCTAssertEqual(date.yesterday(calendar: calendar), expected)
    }
    
    func testTomorrow() {
        let expected = calendar.date(byAdding: .day, value: 1, to: date)
        
        XCTAssertEqual(date.tomorrow(calendar: calendar), expected)
    }
    
    func testFirstDayOfMonth() {
        let expectedDay = 1
        let expectedMonth = calendar.component(.month, from: date)
        let expectedYear = calendar.component(.year, from: date)
        
        let result = date.firstDayOfMonth(calendar: calendar)
        let resultDay = calendar.component(.day, from: result)
        let resultMonth = calendar.component(.month, from: result)
        let resultYear = calendar.component(.year, from: result)
        
        XCTAssertEqual(resultDay, expectedDay)
        XCTAssertEqual(resultMonth, expectedMonth)
        XCTAssertEqual(resultYear, expectedYear)
    }
    
    func testLastDayOfMonth() {
        let dayDate = calendar.component(.day, from: date)
        var expectedDate = calendar.date(byAdding: .day, value: -(dayDate - 1), to: date)!
        expectedDate = calendar.date(byAdding: .month, value: 1, to: expectedDate)!
        expectedDate = calendar.date(byAdding: .day, value: -1, to: expectedDate)!
        
        let expectedDay = calendar.component(.day, from: expectedDate)
        let expectedMonth = calendar.component(.month, from: date)
        let expectedYear = calendar.component(.year, from: date)
        
        let result = date.lastDayOfMonth(calendar: calendar)
        let resultDay = calendar.component(.day, from: result)
        let resultMonth = calendar.component(.month, from: result)
        let resultYear = calendar.component(.year, from: result)
        
        XCTAssertEqual(resultDay, expectedDay)
        XCTAssertEqual(resultMonth, expectedMonth)
        XCTAssertEqual(resultYear, expectedYear)
    }
    
    func testNextMonth() {
        let expected = calendar.date(byAdding: .month, value: 1, to: date)!
        let result = date.nextMonth(calendar: calendar)
        
        XCTAssertEqual(result, expected)
    }
    
    func testPreviousMonth() {
        let expected = calendar.date(byAdding: .month, value: -1, to: date)!
        let result = date.previousMonth(calendar: calendar)
        
        XCTAssertEqual(result, expected)
    }
    
    func testNextWeek() {
        let expected = calendar.date(byAdding: .weekOfYear, value: 1, to: date)!
        let result = date.nextWeek(calendar: calendar)
        
        XCTAssertEqual(result, expected)
    }
    
    func testPreviousWeek() {
        let expected = calendar.date(byAdding: .weekOfYear, value: -1, to: date)!
        let result = date.previousWeek(calendar: calendar)
        
        XCTAssertEqual(result, expected)
    }
    
    func testNumberOfDays() {
        let nextDate = calendar.date(byAdding: .day, value: 60, to: date)!
        
        XCTAssertEqual(date.numberOfDays(to: nextDate, calendar: calendar), 60)
        XCTAssertEqual(nextDate.numberOfDays(to: date, calendar: calendar), 60)
    }
    
    func testIsToday() {
        XCTAssertTrue(now.isToday(calendar: calendar))
        XCTAssertFalse(faker.date.forward(3).isToday(calendar: calendar))
    }
    
    func testIsEqualTo() {
        XCTAssertTrue(date.isEqual(to: date, granularity: .nanosecond))
        XCTAssertFalse(date.isEqual(to: now, granularity: .nanosecond))
        XCTAssertTrue(now.isEqual(to: now, granularity: .nanosecond))
    }
    
    func testIsLessThan() {
        XCTAssertFalse(now.isLess(than: now, granularity: .nanosecond))
        XCTAssertTrue(date.isLess(than: now, granularity: .nanosecond))
        XCTAssertFalse(now.isLess(than: date, granularity: .nanosecond))
    }
    
    func testIsLessThanOrEqual() {
        XCTAssertTrue(now.isLess(thanOrEqual: now, granularity: .nanosecond))
        XCTAssertTrue(date.isLess(than: now, granularity: .nanosecond))
        XCTAssertFalse(now.isLess(thanOrEqual: date, granularity: .nanosecond))
    }
    
    func testIsGreaterThan() {
        XCTAssertTrue(now.isGreater(than: date, granularity: .nanosecond))
        XCTAssertFalse(now.isGreater(than: now, granularity: .nanosecond))
        XCTAssertFalse(date.isGreater(than: date, granularity: .nanosecond))
        XCTAssertFalse(date.isGreater(than: now, granularity: .nanosecond))
    }
    
    func testIsGreaterThanOrEqual() {
        XCTAssertTrue(now.isGreater(thanOrEqual: date, granularity: .nanosecond))
        XCTAssertTrue(now.isGreater(thanOrEqual: now, granularity: .nanosecond))
        XCTAssertTrue(date.isGreater(thanOrEqual: date, granularity: .nanosecond))
        XCTAssertFalse(date.isGreater(thanOrEqual: now, granularity: .nanosecond))
    }
    
    // MARK: Renamed
    
    func testStartDay() {
        XCTAssertEqual(date.startDay(calendar: calendar), date.startOfDay(calendar: calendar))
    }
    
    func testEndDay() {
        XCTAssertEqual(date.endDay(calendar: calendar), date.endOfDay(calendar: calendar))
    }
    
    func testStartDayMonth() {
        XCTAssertEqual(date.startDayMonth(calendar: calendar), date.firstDayOfMonth(calendar: calendar))
    }
    
    func testEndDayMonth() {
        XCTAssertEqual(date.endDayMonth(calendar: calendar), date.lastDayOfMonth(calendar: calendar))
    }
}
