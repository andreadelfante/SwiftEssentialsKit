//
//  RelativeTimeLabel.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 21/02/2020.
//

#if canImport(UIKit)

import UIKit

/// An UILabel, given a reference time, renders that time as a time period relative to the current time..
open class RelativeTimeLabel: UILabel {

    private var timer: Timer?
    private var isUpdateTimerRunning: Bool!

    /// The calendar, default current.
    public var calendar: Calendar = Calendar.current

    /// String to be attached before the reference time.
    public var prefix: String? { didSet { onTriggerTimer() } }

    /// String to be attached after the reference time.
    public var suffix: String? { didSet { onTriggerTimer() } }

    /// Sets the reference time for this view. At any moment, the view will render a relative time period relative to the time set here.
    public var referenceDate: Date? { didSet { onTriggerTimer() } }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    deinit {
        timer?.invalidate()
        timer = nil
    }

    private func commonInit() {
        timer = Timer(fireAt: calculateNextTriggerDate(start: Date()),
                      interval: 0,
                      target: self,
                      selector: #selector(onTriggerTimer),
                      userInfo: nil,
                      repeats: false)

        isUpdateTimerRunning = false
    }

    @objc
    private func onTriggerTimer() {
        //TODO: follow https://github.com/curioustechizen/android-ago/blob/master/android-ago/src/com/github/curioustechizen/ago/RelativeTimeTextView.java
        stopTimer()
        updateTextDisplay()
        startTimer()
    }

    private func startTimer() {
        if timer == nil { commonInit() }
        RunLoop.main.add(timer!, forMode: .common)
        isUpdateTimerRunning = true
    }

    private func updateTextDisplay() {
        let referenceDate = self.referenceDate?.timeAgo(calendar: self.calendar) ?? R.string.timeAgoLocalizable.never()
        text = "\(prefix?.trim ?? "") \(referenceDate) \(suffix?.trim ?? "")"
    }

    private func stopTimer() {
        if isUpdateTimerRunning {
            timer?.invalidate()
            timer = nil
            isUpdateTimerRunning = false
        }
    }

    private func calculateNextTriggerDate(start: Date) -> Date {
        guard let referenceDate = referenceDate else { return start }

        let components = calendar.dateComponents([.weekOfMonth, .day, .hour], from: referenceDate, to: start)

        if let week = components.weekOfMonth, week > 0 {
            return calendar.date(byAdding: .weekOfMonth, value: 1, to: start) ?? start
        } else if let day = components.day, day > 0 {
            return calendar.date(byAdding: .day, value: 1, to: start) ?? start
        } else if let hour = components.hour, hour > 0 {
            return calendar.date(byAdding: .hour, value: 1, to: start) ?? start
        }

        return calendar.date(byAdding: .minute, value: 1, to: start) ?? start
    }
}

#endif
