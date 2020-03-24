//
//  DatePickerDayView.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 26/02/2020.
//

#if canImport(UIKit)

import UIKit
import JTAppleCalendar

#if SWIFT_PACKAGE
import SwiftEssentialsKit_Convenient
#endif

class DatePickerDayView: JTACDayCell {
    @IBOutlet private weak var dayLabel: CircleLabelView!

    var date: Date? {
        didSet {
            dayLabel.text = date?.string(.dd)

            isAccessibilityElement = true
            accessibilityLabel = date?.string(.noDash_EEEEddMMMMyyyy)

            deselect()
        }
    }

    override var isHidden: Bool {
        get { return super.isHidden }
        set {
            dayLabel?.isHidden = newValue
            super.isHidden = newValue
        }
    }

    func select() {
        let color = UIWindow.appearance().tintColor ?? .black

        dayLabel.color = color
        dayLabel.textColor = isDark(color: color) ? .white : .black
    }

    func deselect() {
        dayLabel.color = .clear
        dayLabel.textColor = normalLabelColor
    }

    func outOfRange() {
        dayLabel.textColor = .clear
        dayLabel.color = .clear

        isAccessibilityElement = false
    }

    func notSelectable() {
        dayLabel.textColor = .clear
        dayLabel.color = .clear

        isAccessibilityElement = false
    }

    var normalLabelColor: UIColor {
        if #available(iOS 13.0, *) {
            return .label
        } else {
            return .black
        }
    }

    private func isDark(color: UIColor) -> Bool {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        var brightness: CGFloat = 0.0

        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        // algorithm from: http://www.w3.org/WAI/ER/WD-AERT/#color-contrast
        brightness = ((red * 299) + (green * 587) + (blue * 114)) / 1000
        return brightness < 0.5
    }

}

#endif
