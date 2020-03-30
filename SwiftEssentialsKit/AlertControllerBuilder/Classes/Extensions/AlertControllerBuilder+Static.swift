//
//  AlertControllerBuilder+Static.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 20/02/2020.
//

#if canImport(UIKit)

import UIKit

extension AlertControllerBuilder {

    /// Create a new alert.
    /// - Returns: an alert builder.
    public static var alert: AlertBuilder {
        return AlertControllerBuilder(style: .alert)
    }

    /// Create a new sheet.
    /// - Parameter barButtonItem: the anchor.
    /// - Returns: a sheet builder.
    public static func sheet(_ barButtonItem: UIBarButtonItem) -> SheetBuilder {
        let controller =  AlertControllerBuilder(style: .actionSheet)
        controller.barButtonItem = barButtonItem
        return controller
    }

    /// Create a new sheet.
    /// - Parameter sourceRect: the anchor.
    /// - Returns: a sheet builder.
    public static func sheet(_ sourceRect: CGRect) -> SheetBuilder {
        let controller =  AlertControllerBuilder(style: .actionSheet)
        controller.sourceRect = sourceRect
        return controller
    }

    /// Create automatically an alert if this device is an ipad, otherwise a sheet.
    /// - Parameter barButtonItem: the anchor.
    /// - Returns: an alert builder.
    public static func automaticStyle(_ barButtonItem: UIBarButtonItem) -> AlertBuilderProtocol {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            return alert
        default:
            return sheet(barButtonItem)
        }
    }

    /// Create automatically an alert if this device is an ipad, otherwise a sheet.
    /// - Parameter sourceRect: the anchor.
    /// - Returns: an alert builder.
    public static func automaticStyle(_ sourceRect: CGRect = .zero) -> AlertBuilderProtocol {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            return alert
        default:
            return sheet(sourceRect)
        }
    }
}

#endif
