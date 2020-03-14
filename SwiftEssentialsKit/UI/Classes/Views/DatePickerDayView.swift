//
//  DatePickerDayView.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 26/02/2020.
//

import UIKit
import JTAppleCalendar

class DatePickerDayView: JTACDayCell {
    @IBOutlet private weak var dayLabel: CapsuleLabelView!
    
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
            dayLabel.isHidden = newValue
            super.isHidden = newValue
        }
    }
    
    func select() {
        let color = UIWindow.appearance().tintColor
        
        dayLabel.color = color
        dayLabel.textColor = color != nil && isDark(color: color!) ? .white : .black
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
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        // algorithm from: http://www.w3.org/WAI/ER/WD-AERT/#color-contrast
        brightness = ((r * 299) + (g * 587) + (b * 114)) / 1000;
        return brightness < 0.5
    }

}
