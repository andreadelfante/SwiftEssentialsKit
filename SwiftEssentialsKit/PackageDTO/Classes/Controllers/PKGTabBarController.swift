//
//  PKGTabBarController.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 18/02/2020.
//

import UIKit

/// This class enables you to use Package. It handles all the lifecycle of Package, including destroying it when is not useful anymore.
open class PKGTabBarController: UITabBarController, PKGControllerProtocol {
    public var package: Package?

    deinit {
        package = nil
    }

    open func properties(from package: Package) {

    }
}
