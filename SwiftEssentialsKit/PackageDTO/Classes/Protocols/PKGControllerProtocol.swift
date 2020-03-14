//
//  PKGControllerProtocol.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 18/02/2020.
//

import Foundation

/// This protocol enables package lifecycle.
public protocol PKGControllerProtocol {
    /// The package of this controller. This will be assigned automatically during a controller instantiation.
    var package: Package? { get set }
    
    /// This function populate the controller properties.
    /// - Parameter package: the package containing data.
    func properties(from package: Package)
}
