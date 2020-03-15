//
//  PKGInstantiatableController.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 18/02/2020.
//

#if canImport(UIKit)

import UIKit

/// This protocol defines an instantiatable controller from its code construction.
public protocol PKGInstantiatableController {

    /// This is the controller creation point. In this function you should create a controller from code.
    /// DO NOT CALL DIRECTLY this function to create the controller. You should call `instantiate(with:)`!!
    static func create() -> UIViewController & PKGControllerProtocol

    /// If true, the controller previously created is wrapped in a NavigationController. False otherwise.
    /// The default implementation returns false.
    static var shouldWrapInNavigationController: Bool { get }

    /// This function enables you to configure the controller.
    /// The default implementation is empty.
    /// - Parameter selfController: the controller previously created. If `shouldWrapInNavigationController` returns false, `selfController` is a NavigationController.
    static func configure(selfController: UIViewController)
}

extension PKGInstantiatableController {
    public static var shouldWrapInNavigationController: Bool {
        return false
    }

    public static func configure(selfController: UIViewController) {

    }
}

extension PKGInstantiatableController {

    /// Instantiate this controller. You can provide a package to transfer data between this controller and next controller.
    /// - Parameter package: the package containing data.
    public static func instantiate(with package: Package? = nil) -> UIViewController {
        var controller = create()

        if shouldWrapInNavigationController {
            controller = PKGNavigationController(rootViewController: controller)
        }

        configure(selfController: controller)

        if let package = package {
            controller.package = package
            controller.properties(from: package)
        }

        return controller
    }
}

#endif
