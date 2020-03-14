//
//  Date+TimeAgoTests.swift
//  SwiftEssentialsKit_Tests
//
//  Created by Andrea Del Fante on 22/02/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import Fakery
import SwiftEssentialsKit

class DateTimeAgoTests: XCTestCase {
    private let faker = Faker()
    private let calendar = Calendar.current
    private var now: Date!
    private var dataSet: [String: [Date: String]]!
    
    override func setUp() {
        super.setUp()
        
        now = Date()
        dataSet = [
            "en": [
                now: "Just now",
                date(from: now, subtract: .second, 3): "3 seconds ago",
                date(from: now, subtract: .second, 4): "4 seconds ago",
                date(from: now, subtract: .minute, 1): "A minute ago",
                date(from: now, subtract: .minute, 2): "2 minutes ago",
                date(from: now, subtract: .minute, 3): "3 minutes ago",
                date(from: now, subtract: .hour, 1): "An hour ago",
                date(from: now, subtract: .hour, 2): "2 hours ago",
                date(from: now, subtract: .hour, 3): "3 hours ago",
                date(from: now, subtract: .day, 1): "Yesterday",
                date(from: now, subtract: .day, 2): "2 days ago",
                date(from: now, subtract: .day, 3): "3 days ago",
                date(from: now, subtract: .weekOfYear, 1): "Last week",
                date(from: now, subtract: .weekOfYear, 2): "2 weeks ago",
                date(from: now, subtract: .weekOfYear, 3): "3 weeks ago",
                date(from: now, subtract: .month, 1): "Last month",
                date(from: now, subtract: .month, 2): "2 months ago",
                date(from: now, subtract: .month, 3): "3 months ago",
                date(from: now, subtract: .year, 1): "Last year",
                date(from: now, subtract: .year, 2): "2 years ago",
                date(from: now, subtract: .year, 3): "3 years ago"
            ],
            "it": [
                now: "Adesso",
                date(from: now, subtract: .second, 3): "3 secondi fa",
                date(from: now, subtract: .second, 4): "4 secondi fa",
                date(from: now, subtract: .minute, 1): "Un minuto fa",
                date(from: now, subtract: .minute, 2): "2 minuti fa",
                date(from: now, subtract: .minute, 3): "3 minuti fa",
                date(from: now, subtract: .hour, 1): "Un'ora fa",
                date(from: now, subtract: .hour, 2): "2 ore fa",
                date(from: now, subtract: .hour, 3): "3 ore fa",
                date(from: now, subtract: .day, 1): "Ieri",
                date(from: now, subtract: .day, 2): "2 giorni fa",
                date(from: now, subtract: .day, 3): "3 giorni fa",
                date(from: now, subtract: .weekOfYear, 1): "La settimana scorsa",
                date(from: now, subtract: .weekOfYear, 2): "2 settimane fa",
                date(from: now, subtract: .weekOfYear, 3): "3 settimane fa",
                date(from: now, subtract: .month, 1): "Il mese scorso",
                date(from: now, subtract: .month, 2): "2 mesi fa",
                date(from: now, subtract: .month, 3): "3 mesi fa",
                date(from: now, subtract: .year, 1): "L'anno scorso",
                date(from: now, subtract: .year, 2): "2 anni fa",
                date(from: now, subtract: .year, 3): "3 anni fa"
            ],
            "es": [
                now: "Justo ahora",
                date(from: now, subtract: .second, 3): "3 hace segundos",
                date(from: now, subtract: .second, 4): "4 hace segundos",
                date(from: now, subtract: .minute, 1): "Hace un minuto",
                date(from: now, subtract: .minute, 2): "2 hace minutos",
                date(from: now, subtract: .minute, 3): "3 hace minutos",
                date(from: now, subtract: .hour, 1): "Hace una hora",
                date(from: now, subtract: .hour, 2): "2 hace horas",
                date(from: now, subtract: .hour, 3): "3 hace horas",
                date(from: now, subtract: .day, 1): "Ayer",
                date(from: now, subtract: .day, 2): "2 hace dias",
                date(from: now, subtract: .day, 3): "3 hace dias",
                date(from: now, subtract: .weekOfYear, 1): "La semana pasada",
                date(from: now, subtract: .weekOfYear, 2): "2 hace semanas",
                date(from: now, subtract: .weekOfYear, 3): "3 hace semanas",
                date(from: now, subtract: .month, 1): "Mes pasado",
                date(from: now, subtract: .month, 2): "2 hace meses",
                date(from: now, subtract: .month, 3): "3 hace meses",
                date(from: now, subtract: .year, 1): "El año pasado",
                date(from: now, subtract: .year, 2): "2 hace años",
                date(from: now, subtract: .year, 3): "3 hace años"
            ]
        ]
    }
    
    func testTimeAgo() {
        dataSet.forEach { (language, dateStringMap) in
            dateStringMap.forEach { (date, expected) in
                XCTAssertEqual(date.timeAgo(since: now, calendar: calendar, preferredLanguages: [language]), expected)
            }
        }
    }
    
    private func date(from date: Date, subtract component: Calendar.Component, _ value: Int) -> Date {
        return calendar.date(byAdding: component, value: -value, to: date)!
    }
}
