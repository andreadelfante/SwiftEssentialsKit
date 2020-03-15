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

    /// Create automatically a sheet if this device is an ipad, otherwise an alert.
    /// - Parameter barButtonItem: the anchor.
    /// - Returns: an alert builder.
    public static func automaticStyle(_ barButtonItem: UIBarButtonItem) -> AlertBuilderProtocol {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            return sheet(barButtonItem)
        default:
            return alert
        }
    }

    /// Create automatically a sheet if this device is an ipad, otherwise an alert.
    /// - Parameter sourceRect: the anchor.
    /// - Returns: an alert builder.
    public static func automaticStyle(_ sourceRect: CGRect) -> AlertBuilderProtocol {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            return sheet(sourceRect)
        default:
            return alert
        }
    }
}

#endif
