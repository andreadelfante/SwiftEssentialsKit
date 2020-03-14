//
//  Info.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 03/03/2020.
//

#if os(OSX)
    import Cocoa
#else
    import Foundation
    //import UIKit
#endif

/// Info.plist assistant.
public struct Info {
    public let bundle: Bundle

    /// Create an Info assistant with a specific bundle.
    /// - Parameter bundle: the bundle.
    public init(bundle: Bundle) {
        self.bundle = bundle
    }

    /// Get an Info assistant with `Bundle.main`.
    public static var main: Info {
        return Info(bundle: Bundle.main)
    }

    /// Get the version in the bundle info dictionary.
    public var version: String? {
        return bundle.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    /// Get the build in the bundle info dictionary.
    public var build: String? {
        return bundle.infoDictionary?["CFBundleVersion"] as? String
    }

    /// Get the bundle identifier of the bundle.
    public var bundleIdentifier: String? {
        return bundle.bundleIdentifier
    }

    /// Get the display name in the bundle info dictionary.
    public var displayName: String? {
        return bundle.infoDictionary?["CFBundleDisplayName"] as? String
    }

    /// Get if is status bar hidden in the bundle info dictionary.
    public var isInitiallyStatusBarHidden: Bool? {
        return bundle.infoDictionary?["UIStatusBarHidden"] as? Bool
    }

    /// Get the status bar style in the bundle info dictionary.
    public var statusBarStyle: UIStatusBarStyle? {
        guard let value = bundle.infoDictionary?["UIStatusBarStyle"] as? String else { return nil }

        if value == "UIStatusBarStyleLightContent" {
            return .lightContent
        } else if value == "UIStatusBarStyleDefault" {
            return .default
        }
        return nil
    }
}
