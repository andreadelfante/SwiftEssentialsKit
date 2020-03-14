//
//  Date+TimeAgo.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 21/02/2020.
//

import Foundation

extension Date {
    
    /// Calculate difference between dates and return a string containing human readable time ago.
    /// - Parameters:
    ///   - date: the other date.
    ///   - calendar: the calendar.
    /// - Returns: a string for time ago.
    public func timeAgo(
        since date: Date = Date(),
        calendar: Calendar = Calendar.current,
        preferredLanguages: [String]? = nil
    ) -> String {
        let unitFlags: Set<Calendar.Component> = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
        let components = calendar.dateComponents(unitFlags, from: self, to: date)
        
        if let year = components.year, year >= 2 {
            return R.string.timeAgoLocalizable.nYearsAgo(year, preferredLanguages: preferredLanguages)
        }
        
        if let year = components.year, year >= 1 {
            return R.string.timeAgoLocalizable.lastYear(preferredLanguages: preferredLanguages)
        }
        
        if let month = components.month, month >= 2 {
            return R.string.timeAgoLocalizable.nMonthsAgo(month, preferredLanguages: preferredLanguages)
        }
        
        if let month = components.month, month >= 1 {
            return R.string.timeAgoLocalizable.lastMonth(preferredLanguages: preferredLanguages)
        }
        
        if let week = components.weekOfYear, week >= 2 {
            return R.string.timeAgoLocalizable.nWeeksAgo(week, preferredLanguages: preferredLanguages)
        }
        
        if let week = components.weekOfYear, week >= 1 {
            return R.string.timeAgoLocalizable.lastWeek(preferredLanguages: preferredLanguages)
        }
        
        if let day = components.day, day >= 2 {
            return R.string.timeAgoLocalizable.nDaysAgo(day, preferredLanguages: preferredLanguages)
        }
        
        if let day = components.day, day >= 1 {
            return R.string.timeAgoLocalizable.yesterday(preferredLanguages: preferredLanguages)
        }
        
        if let hour = components.hour, hour >= 2 {
            return R.string.timeAgoLocalizable.nHoursAgo(hour, preferredLanguages: preferredLanguages)
        }
        
        if let hour = components.hour, hour >= 1 {
            return R.string.timeAgoLocalizable.anHourAgo(preferredLanguages: preferredLanguages)
        }
        
        if let minute = components.minute, minute >= 2 {
            return R.string.timeAgoLocalizable.nMinutesAgo(minute, preferredLanguages: preferredLanguages)
        }
        
        if let minute = components.minute, minute >= 1 {
            return R.string.timeAgoLocalizable.aMinuteAgo(preferredLanguages: preferredLanguages)
        }
        
        if let second = components.second, second >= 3 {
            return R.string.timeAgoLocalizable.nSecondsAgo(second, preferredLanguages: preferredLanguages)
        }
        
        return R.string.timeAgoLocalizable.justNow(preferredLanguages: preferredLanguages)
    }
}
