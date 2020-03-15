//
//  AlertControllerBuilder+AlertBuilderProtocol.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 20/02/2020.
//

#if canImport(UIKit)

import UIKit

extension AlertControllerBuilder: AlertBuilderProtocol {
    public func title(_ title: String) -> Self {
        self.title = title
        return self
    }

    public func message(_ message: String) -> Self {
        self.message = message
        return self
    }

    public func addAction(builder: () -> UIAlertAction) -> Self {
        self.actions.append(builder())
        return self
    }

    public func build() -> UIAlertController {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: style)

        if let barButtonItem = self.barButtonItem {
            alertController.popoverPresentationController?.barButtonItem = barButtonItem
        } else if let sourceRect = self.sourceRect {
            alertController.popoverPresentationController?.sourceRect = sourceRect
        }

        for configuration in textFields {
            alertController.addTextField(configurationHandler: configuration)
        }

        for action in actions {
            alertController.addAction(action)
        }

        self.validateAll()

        return alertController
    }

    @discardableResult
    public func show(in context: UIViewController, animated: Bool = true, completion: AlertControllerBuilder.ShowCompletion? = nil) -> HideableAlert {
        let alertController = self.build()
        context.present(alertController, animated: animated, completion: completion)
        return alertController
    }
}

#endif
