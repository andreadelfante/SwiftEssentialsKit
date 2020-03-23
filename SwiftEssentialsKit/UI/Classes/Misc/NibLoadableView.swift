//
//  NibLoadableView.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 23/03/2020.
//

#if canImport(UIKit)

import UIKit

/// Convenient protocol to enable instantiation from nib.
public protocol NibLoadableView {
    /// Defines the view associated nib.
    static var nib: UINib { get }
}

extension NibLoadableView where Self: UIView {
    
    /// Instantiate this view from its associated nib.
    public static func instantiate() -> Self {
        guard let nibObject = self.nib.instantiate(withOwner: Self.self, options: nil).last as? Self else {
            fatalError("Failed to create an instance of \(self) from nib.")
        }
        return nibObject
    }
}

#endif
