//
//  DatePickerController.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 25/02/2020.
//

import UIKit
import JTAppleCalendar

/// The DatePickerController delegate to defime some actions.
public protocol DatePickerControllerDelegate: class {
    
    /// This func is triggered when the user select a date.
    /// - Parameters:
    ///   - controller: the current DatePickerController.
    ///   - date: the selected date.
    func datePickerController(_ controller: DatePickerController, onSelect date: Date)
    
    /// Check if the date is selectable.
    /// - Parameters:
    ///   - controller: the current DatePickerController.
    ///   - date: the date.
    /// - Returns: true if the date is selectable, false otherwise.
    func datePickerController(_ controller: DatePickerController, isSelectable date: Date) -> Bool
}

/// A calendar date picker.
public class DatePickerController: PKGViewController, JTACMonthViewDelegate, JTACMonthViewDataSource {
    
    private enum PackageKeys: String, Hashable {
        case calendar = "packageCalendar"
        case current = "packageCurrentDate"
        case start = "packageStartDate"
        case end = "packageEndDate"
        case delegate = "packageDelegate"
    }
    
    @IBOutlet private weak var calendarView: JTACMonthView!
    @IBOutlet private weak var mondayLabel: UILabel!
    @IBOutlet private weak var tuesdayLabel: UILabel!
    @IBOutlet private weak var wednesdayLabel: UILabel!
    @IBOutlet private weak var thursdayLabel: UILabel!
    @IBOutlet private weak var fridayLabel: UILabel!
    @IBOutlet private weak var saturdayLabel: UILabel!
    @IBOutlet private weak var sundayLabel: UILabel!
    
    private var calendar: Calendar!
    private var currentDate: Date!
    private var startDate: Date!
    private var endDate: Date!
    private var delegate: DatePickerControllerDelegate?
    
    private static func createPackage(
        calendar: Calendar,
        current: Date,
        start: Date,
        end: Date,
        delegate: DatePickerControllerDelegate?
    ) -> Package {
        return Package()
            .put(key: PackageKeys.calendar, element: calendar)
            .put(key: PackageKeys.current, element: current)
            .put(key: PackageKeys.start, element: start)
            .put(key: PackageKeys.end, element: end)
            .put(key: PackageKeys.delegate, element: delegate)
    }
    
    public override func properties(from package: Package) {
        super.properties(from: package)
        
        calendar = package[PackageKeys.calendar]
        currentDate = package[PackageKeys.current]
        startDate = package[PackageKeys.start]
        endDate = package[PackageKeys.end]
        delegate = package[PackageKeys.delegate]
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        title = R.string.datePickerLocalizable.titleSelectDate()
        
        navigationItem.leftBarButtonItem = CloseBarButtonItem(target: self, action: #selector(onTapClose))
        let today = UIBarButtonItem(title: R.string.datePickerLocalizable.lblToday(),
                                    style: .plain,
                                    target: self,
                                    action: #selector(onTapToday))
        
        today.isEnabled = delegate?.datePickerController(self, isSelectable: Date().startDay()) ?? true
        navigationItem.rightBarButtonItem = today
        
        mondayLabel.text = R.string.datePickerLocalizable.lblMon()
        tuesdayLabel.text = R.string.datePickerLocalizable.lblTue()
        wednesdayLabel.text = R.string.datePickerLocalizable.lblWed()
        thursdayLabel.text = R.string.datePickerLocalizable.lblThu()
        fridayLabel.text = R.string.datePickerLocalizable.lblFri()
        saturdayLabel.text = R.string.datePickerLocalizable.lblSat()
        sundayLabel.text = R.string.datePickerLocalizable.lblSun()
        
        mondayLabel.isAccessibilityElement = false
        tuesdayLabel.isAccessibilityElement = false
        wednesdayLabel.isAccessibilityElement = false
        thursdayLabel.isAccessibilityElement = false
        fridayLabel.isAccessibilityElement = false
        saturdayLabel.isAccessibilityElement = false
        sundayLabel.isAccessibilityElement = false
        
        self.initCalendarView()
    }
    
    //MARK: - JTAppleCalendar
    
    public func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        return ConfigurationParameters(startDate: startDate,
                                       endDate: endDate,
                                       numberOfRows: 6,
                                       calendar: Calendar.current,
                                       generateInDates: .forAllMonths,
                                       generateOutDates: .tillEndOfRow,
                                       firstDayOfWeek: .monday,
                                       hasStrictBoundaries: true)
    }
    
    public func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: R.nib.datePickerDayView.name, for: indexPath) as! DatePickerDayView
        populate(cell: cell, date: date, cellState: cellState)
        return cell
    }
    
    public func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        if let cell = cell as? DatePickerDayView {
            populate(cell: cell, date: date, cellState: cellState)
        }
    }
    
    private func populate(cell: DatePickerDayView, date: Date, cellState: CellState) {
        cell.date = date
        
        if cellState.isSelected || date.isEqual(to: currentDate, granularity: .day, calendar: calendar) {
            cell.select()
        } else {
            cell.deselect()
        }
        
        if cellState.dateBelongsTo != .thisMonth {
            cell.outOfRange()
        } else if !(delegate?.datePickerController(self, isSelectable: date) ?? true) {
            cell.notSelectable()
        }
    }
    
    public func calendar(_ calendar: JTACMonthView, shouldSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) -> Bool {
        return (delegate?.datePickerController(self, isSelectable: date) ?? true) &&
            startDate.isLess(thanOrEqual: date, granularity: .day, calendar: self.calendar) &&
            date.isLess(thanOrEqual: endDate, granularity: .day, calendar: self.calendar)
    }
    
    public func calendar(_ calendar: JTACMonthView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTACMonthReusableView {
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: String(describing: JTACMonthReusableView.self), for: indexPath)
        header.subviews.forEach { $0.removeFromSuperview() }
        
        let label = UILabel(frame: CGRect(x: 0, y: 8, width: header.frame.width, height: header.frame.height))
        label.text = range.start.string(.MMMMyyyy)
        label.textColor = blackAdaptiveColor
        
        if #available(iOS 8.2, *) {
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        } else {
            label.font = UIFont.boldSystemFont(ofSize: 24)
        }
        
        label.textAlignment = .center
        header.addSubview(label)
        
        return header
    }
    
    public func calendarSizeForMonths(_ calendar: JTACMonthView?) -> MonthSize? {
        return MonthSize(defaultSize: 42)
    }
    
    public func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        self.currentDate = date
        
        if let cell = cell as? DatePickerDayView {
            cell.select()
        }
        
        delegate?.datePickerController(self, onSelect: date)
    }
    
    public func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        
        if let cell = cell as? DatePickerDayView {
            cell.deselect()
            
            if cellState.dateBelongsTo != .thisMonth {
                cell.outOfRange()
            }
        }
    }
    
    //MARK: - Private functions
    
    @objc
    private func onTapClose() {
        self.dismiss(animated: true)
    }
    
    @objc
    private func onTapToday() {
        delegate?.datePickerController(self, onSelect: Date().startDay())
    }
    
    private func initCalendarView() {
        calendarView.allowsMultipleSelection = false
        calendarView.scrollingMode = .none
        calendarView.calendarDelegate = self
        calendarView.calendarDataSource = self
        calendarView.cellSize = view.frame.width / (UIDevice.current.userInterfaceIdiom == .pad ? 16 : 8)
        
        calendarView.register(JTACMonthReusableView.self,
                              forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                              withReuseIdentifier: String(describing: JTACMonthReusableView.self))
        
        calendarView.register(UINib(resource: R.nib.datePickerDayView),
                              forCellWithReuseIdentifier: R.nib.datePickerDayView.name)
        
        calendarView.scrollToDate(currentDate, triggerScrollToDateDelegate: true, animateScroll: false)
        calendarView.selectDates([currentDate], triggerSelectionDelegate: false, keepSelectionIfMultiSelectionAllowed: false)
    }
    
    private var blackAdaptiveColor: UIColor {
        if #available(iOS 13.0, *) {
            return .label
        } else {
            return .black
        }
    }
}

extension DatePickerController: PKGInstantiatableStoryboard {
    public static var storyboardSource: UIStoryboard = R.storyboard.datePickers()
    public static var storyboardIdentifier: String = R.storyboard.datePickers.datePickerControllerId.identifier
    
    /// Create a new calendar date picker.
    /// - Parameters:
    ///   - calendar: the calendar.
    ///   - current: the current date.
    ///   - start: the start date.
    ///   - end: the end date.
    ///   - delegate: the delegate.
    /// - Returns: a new DatePickerController.
    public static func instantiate(
        calendar: Calendar = Calendar.current,
        current: Date,
        start: Date,
        end: Date,
        delegate: DatePickerControllerDelegate? = nil
    ) -> UIViewController {
        let package = createPackage(calendar: calendar,
                                    current: current,
                                    start: start,
                                    end: end,
                                    delegate: delegate)
        
        return instantiate(with: package)
    }
    
    public static var shouldWrapInNavigationController: Bool {
        return true
    }
    
    public static func configure(selfController: UIViewController) {
        selfController.modalPresentationStyle = .formSheet
    }
}
