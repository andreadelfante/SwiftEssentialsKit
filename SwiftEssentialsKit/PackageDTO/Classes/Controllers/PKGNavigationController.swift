//
//  PKGNavigationController.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 19/02/2020.
//

#if canImport(UIKit)

import UIKit

/// This class enables you to use Package. It handles all the lifecycle of Package, including destroying it when is not useful anymore.
open class PKGNavigationController: UINavigationController, PKGControllerProtocol {
    public var package: Package? {
        get { return rootPKGController?.package }
        set {
            var controller = rootPKGController
            controller?.package = newValue
        }
    }

    deinit {
        package = nil
    }

    open func properties(from package: Package) {
        rootPKGController?.properties(from: package)
    }

    private var rootPKGController: PKGControllerProtocol? {
        return viewControllers.first as? PKGControllerProtocol
    }
}

#endif
