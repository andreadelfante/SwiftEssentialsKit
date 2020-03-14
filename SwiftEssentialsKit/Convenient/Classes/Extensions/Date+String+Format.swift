//
//  Date+String+Format.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 21/02/2020.
//

import Foundation

/// This contains common date format pattern.
public enum DateFormatPattern: String, CaseIterable {
    /// Format: dd-MM-yyyy
    case ddMMyyyy = "dd-MM-yyyy"
    /// Format: yyyy-MM-dd'T'HH:mm:ssZZZZZ
    case yyyyMMddTHHmmssZZZZZ = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    /// Format: yyyy-MM-dd
    case yyyyMMdd = "yyyy-MM-dd"
    /// Format: yyyy-MM-dd HH:mm:ss
    case yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss"
    /// Format: yyyyMMdd
    case noDash_yyyyMMdd = "yyyyMMdd"
    /// Format: dd MMMM yyyy
    case noDash_ddMMMMyyyy = "dd MMMM yyyy"
    /// Format: EEEE dd MMM yyyy
    case noDash_EEEEddMMMyyyy = "EEEE dd MMM yyyy"
    /// Format: EEEE dd MMMM yyyy
    case noDash_EEEEddMMMMyyyy = "EEEE dd MMMM yyyy"
    /// Format: EE
    case EE = "EE"
    /// Format: EEE
    case EEE = "EEE"
    /// Format: EEEE
    case EEEE = "EEEE"
    /// Format: dd
    case dd = "dd"
    /// Format: MMM
    case MMM = "MMM"
    /// Format: MMMM
    case MMMM = "MMMM"
    /// Format: yyyy
    case yyyy = "yyyy"
    /// Format: MMMM yyyy
    case MMMMyyyy = "MMMM yyyy"
    /// Format: dd/MM
    case slash_ddMM = "dd/MM"
    /// Format: dd/MM/yyyy
    case slash_ddMMyyyy = "dd/MM/yyyy"
    /// Format: dd/MM/yyyy HH:mm
    case slash_ddMMyyyyHHmm = "dd/MM/yyyy HH:mm"
    /// Format: dd/MM/yyyy h:mm
    case slash_ddMMyyyyhmm = "dd/MM/yyyy h:mm"
    /// Format: MM/dd/yyyy HH:mm
    case slash_MMddyyyyHHmm = "MM/dd/yyyy HH:mm"
    /// Format: MM/dd/yyyy h:mm
    case slash_MMddyyyyhmm = "MM/dd/yyyy h:mm"
    /// Format: HH:mm
    case HHmm = "HH:mm"
    /// Format: HH:mm:ss
    case HHmmss = "HH:mm:ss"
    /// Format: h:mm
    case hmm = "h:mm"
}

extension Date {

    /// Create a new string using this date.
    ///
    /// - Parameter pattern: the date pattern
    /// - Returns: A new string formatted
    public func string(_ pattern: DateFormatPattern) -> String {
        return DateFormatter(pattern: pattern).string(from: self)
    }
}

extension String {

    /// Create a new date using this string.
    ///
    /// - Parameter pattern: the date pattern
    /// - Returns: A new date if this string is well formatted, otherwise nil.
    public func date(_ pattern: DateFormatPattern) -> Date? {
        return DateFormatter(pattern: pattern).date(from: self)
    }
}

extension DateFormatter {

    fileprivate convenience init(
        pattern: DateFormatPattern,
        timeZone: TimeZone = TimeZone.current,
        calendar: Calendar = Calendar.current
    ) {
        self.init(dateFormat: pattern.rawValue,
                  timeZone: timeZone,
                  calendar: calendar)
    }

    fileprivate convenience init(
        dateFormat: String,
        timeZone: TimeZone = TimeZone.current,
        calendar: Calendar = Calendar.current
    ) {
        self.init()

        self.dateFormat = dateFormat
        self.timeZone = timeZone
        self.calendar = calendar
    }
}
