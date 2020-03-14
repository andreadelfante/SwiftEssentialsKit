//
//  PKGInstantiatableStoryboard.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 18/02/2020.
//

import UIKit

/// This protocol defines an instantiatable controller from storyboard.
public protocol PKGInstantiatableStoryboard: PKGInstantiatableController {

    /// The source storyboard.
    static var storyboardSource: UIStoryboard { get }
    
    /// The controller identifier specified in `storyboardSource` (Storyboard).
    static var storyboardIdentifier: String { get }
}

extension PKGInstantiatableStoryboard {
    public static func create() -> UIViewController & PKGControllerProtocol {
        guard let controller = storyboardSource
            .instantiateViewController(withIdentifier: storyboardIdentifier)
            as? (UIViewController & PKGControllerProtocol) else {
                fatalError("""
                '\(Self.self)' is not a subtype of 'PKGControllerProtocol'.
                Please implement 'PKGControllerProtocol' in your controller, or use one of these controller:
                - PKGViewController
                - PKGNavigationController
                - PKGTableViewController
                - PKGCollectionController
                - PKGTabBarController
                - PKGPageViewController
                - PKGSplitViewController
                """)
        }
        
        return controller
    }
    
    public static var shouldWrapInNavigationController: Bool {
        return false
    }
    
    public static func configure(selfController: UIViewController) {
        
    }
}
