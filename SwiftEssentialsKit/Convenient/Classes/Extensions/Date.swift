//
//  Date.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 21/02/2020.
//

import Foundation

extension Date {

    /// Create a new date setting hour, minute, and second to 0
    ///
    /// - Parameter calendar: a calendar
    /// - Returns: the beginning of the date
    public func startOfDay(calendar: Calendar = Calendar.current) -> Date {
        return calendar.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
    }

    /// Create a new date setting hour to 23, minute to 59, and second to 59
    ///
    /// - Parameter calendar: a calendar
    /// - Returns: the ending of the date
    public func endOfDay(calendar: Calendar = Calendar.current) -> Date {
        return calendar.date(bySettingHour: 23, minute: 59, second: 59, of: self)!
    }

    /// Create a new date with yesterday values.
    ///
    /// - Parameter calendar: a calendar
    /// - Returns: a yesterday date
    public func yesterday(calendar: Calendar = Calendar.current) -> Date {
        return calendar.date(byAdding: .day, value: -1, to: self)!
    }

    /// Create a new date with tomorrow values.
    ///
    /// - Parameter calendar: a calendar
    /// - Returns: a tomorrow date
    public func tomorrow(calendar: Calendar = Calendar.current) -> Date {
        return calendar.date(byAdding: .day, value: 1, to: self)!
    }

    /// Create a new first date of this month
    ///
    /// - Parameter calendar: a calendar
    /// - Returns: a first date of this month
    public func firstDayOfMonth(calendar: Calendar = Calendar.current) -> Date {
        let day = calendar.component(.day, from: self)
        return calendar.date(byAdding: .day, value: -(day - 1), to: self)!
    }

    /// Create a new last date of this month
    ///
    /// - Parameter calendar: a calendar
    /// - Returns: a last date of this month
    public func lastDayOfMonth(calendar: Calendar = Calendar.current) -> Date {
        let nextMonth = firstDayOfMonth(calendar: calendar)
            .nextMonth(calendar: calendar)

        return calendar.date(byAdding: .day, value: -1, to: nextMonth)!
    }

    /// Create a new date with next month values
    ///
    /// - Parameter calendar: a calendar
    /// - Returns: a next month date
    public func nextMonth(calendar: Calendar = Calendar.current) -> Date {
        return calendar.date(byAdding: .month, value: 1, to: self)!
    }

    /// Create a new date with previous month values
    ///
    /// - Parameter calendar: a calendar
    /// - Returns: a previous month date
    public func previousMonth(calendar: Calendar = Calendar.current) -> Date {
        return calendar.date(byAdding: .month, value: -1, to: self)!
    }
    
    /// Create a new date with next week values
    ///
    /// - Parameter calendar: a calendar
    /// - Returns: a next week date
    public func nextWeek(calendar: Calendar = Calendar.current) -> Date {
        return calendar.date(byAdding: .weekOfYear, value: 1, to: self)!
    }
    
    /// Create a new date with previous week values
    ///
    /// - Parameter calendar: a calendar
    /// - Returns: a previous week date
    public func previousWeek(calendar: Calendar = Calendar.current) -> Date {
        return calendar.date(byAdding: .weekOfYear, value: -1, to: self)!
    }

    /// Number of days between this and another date, no matter what the order.
    /// - Parameters:
    ///   - date: the other date.
    ///   - calendar: the calendar.
    /// - Returns: the number of days.
    public func numberOfDays(to date: Date, calendar: Calendar = Calendar.current) -> Int {
        return calendar.dateComponents([.day],
                                       from: min(self, date),
                                       to: max(self, date))
            .day!
    }
}

extension Date {

    /// Check if this date is today.
    /// - Parameter calendar: a calendar
    /// - Returns: **true** iff this date is today, otherwise **false**
    public func isToday(calendar: Calendar = Calendar.current) -> Bool {
        return calendar.compare(self, to: Date(), toGranularity: .day) == .orderedSame
    }

    /// Check if this date is equal to other date.
    /// - Parameters:
    ///   - date: the other date.
    ///   - granularity: the granularity.
    ///   - calendar: the calendar.
    public func isEqual(to date: Date, granularity: Calendar.Component, calendar: Calendar = Calendar.current) -> Bool {
        return calendar.compare(self, to: date, toGranularity: granularity) == .orderedSame
    }

    /// Check if this date is less than other date.
    /// - Parameters:
    ///   - date: the other date.
    ///   - granularity: the granularity.
    ///   - calendar: the calendar.
    public func isLess(than date: Date, granularity: Calendar.Component, calendar: Calendar = Calendar.current) -> Bool {
        return calendar.compare(self, to: date, toGranularity: granularity) == .orderedAscending
    }

    /// Check if this date is less than or equal to other date.
    /// - Parameters:
    ///   - date: the other date.
    ///   - granularity: the granularity.
    ///   - calendar: the calendar.
    public func isLess(thanOrEqual date: Date, granularity: Calendar.Component, calendar: Calendar = Calendar.current) -> Bool {
        return calendar.compare(self, to: date, toGranularity: granularity) != .orderedDescending
    }

    /// Check if this date is greater than other date.
    /// - Parameters:
    ///   - date: the other date.
    ///   - granularity: the granularity.
    ///   - calendar: the calendar.
    public func isGreater(than date: Date, granularity: Calendar.Component, calendar: Calendar = Calendar.current) -> Bool {
        return calendar.compare(self, to: date, toGranularity: granularity) == .orderedDescending
    }

    /// Check if this date is greater than or equal to other date.
    /// - Parameters:
    ///   - date: the other date.
    ///   - granularity: the granularity.
    ///   - calendar: the calendar.
    public func isGreater(thanOrEqual date: Date, granularity: Calendar.Component, calendar: Calendar = Calendar.current) -> Bool {
        return calendar.compare(self, to: date, toGranularity: granularity) != .orderedAscending
    }
}

// MARK: Renamed

extension Date {
    /// Create a new date setting hour, minute, and second to 0
    ///
    /// - Parameter calendar: a calendar
    /// - Returns: the beginning of the date
    @available(*, renamed: "startOfDay(calendar:)", message: "This function will be removed in future release.")
    public func startDay(calendar: Calendar = Calendar.current) -> Date {
        return startOfDay(calendar: calendar)
    }

    /// Create a new last date of this month
    ///
    /// - Parameter calendar: a calendar
    /// - Returns: a last date of this month
    @available(*, renamed: "lastDayOfMonth(calendar:)", message: "This function will be removed in future release.")
    public func endDayMonth(calendar: Calendar = Calendar.current) -> Date {
        return lastDayOfMonth(calendar: calendar)
    }

    /// Create a new first date of this month
    ///
    /// - Parameter calendar: a calendar
    /// - Returns: a first date of this month
    @available(*, renamed: "firstDayOfMonth(calendar:)", message: "This function will be removed in future release.")
    public func startDayMonth(calendar: Calendar = Calendar.current) -> Date {
        return firstDayOfMonth(calendar: calendar)
    }

    /// Create a new date setting hour to 23, minute to 59, and second to 59
    ///
    /// - Parameter calendar: a calendar
    /// - Returns: the ending of the date
    @available(*, renamed: "endOfDay(calendar:)", message: "This function will be removed in future release.")
    public func endDay(calendar: Calendar = Calendar.current) -> Date {
        return endOfDay(calendar: calendar)
    }
}
