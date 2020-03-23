//
//  UIViewController.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 23/03/2020.
//

#if canImport(UIKit)

import UIKit

extension UIViewController {
    
    /// Automatically handles how to present the next view controller.
    /// If the next view controller is a UINavigationController then present it; otherwise if self has a UINavigationController then push the next controller; otherwise present the next view controller.
    /// - Parameters:
    ///   - viewControllerToPresent: the next view controller to present.
    ///   - animated: this presentation has animation?
    ///   - completion: the completion after presentation.
    public func presentAutomatically(
        _ viewControllerToPresent: UIViewController,
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        if viewControllerToPresent is UINavigationController {
            present(viewControllerToPresent, animated: animated, completion: completion)
        } else if let navigationController = navigationController {
            navigationController.pushViewController(viewControllerToPresent, animated: animated)
            completion?()
        } else {
            present(viewControllerToPresent, animated: animated, completion: completion)
        }
    }
    
    /// Automatically handles how to dismiss this view controller.
    /// If this view controller has a UINavigationController and its UINavigationController has more than 1 view controllers then pop this view controller; otherwise dismiss this view controller.
    /// - Parameters:
    ///   - animated: this presentation has animation?
    ///   - completion: the completion after dismission.
    public func dismissAutomatically(animated: Bool = true, completion: (() -> Void)? = nil) {
        if let navigationController = navigationController, navigationController.viewControllers.count > 1 {
            navigationController.popViewController(animated: animated)
            completion?()
        } else {
            dismiss(animated: animated, completion: completion)
        }
    }
}

#endif
