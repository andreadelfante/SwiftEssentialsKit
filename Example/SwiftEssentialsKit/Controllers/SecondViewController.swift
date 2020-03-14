//
//  SecondViewController.swift
//  SwiftEssentialsKit_Example
//
//  Created by Andrea Del Fante on 19/02/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SwiftEssentialsKit

class SecondViewController: PKGViewController {
    
    private enum PackageKeys: String, Hashable {
        case text = "packageText"
    }
    
    private var text: String!
    
    static func package(text: String) -> Package {
        return Package()
            .put(key: PackageKeys.text, element: text)
    }
    
    override func properties(from package: Package) {
        super.properties(from: package)
        
        text = package[PackageKeys.text]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = text
    }
}

extension SecondViewController: PKGInstantiatableStoryboard {
    static var storyboardSource: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    static var storyboardIdentifier: String = "SecondViewControllerId"
    
    static func instantiate(text: String) -> UIViewController {
        return instantiate(with: SecondViewController.package(text: text))
    }
}
