//
//  ThirdViewController.swift
//  SwiftEssentialsKit_Example
//
//  Created by Andrea Del Fante on 19/02/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SwiftEssentialsKit

class ThirdViewController: PKGTableViewController {
    
    private enum PackageKeys: String, Hashable {
        case bool = "bool"
    }
    
    private var bool: Bool!
    
    static func package(bool: Bool) -> Package {
        return Package()
            .put(key: PackageKeys.bool, element: bool)
    }
    
    override func properties(from package: Package) {
        super.properties(from: package)
        
        bool = package[PackageKeys.bool]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = String(describing: bool)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(onTapClose))
    }
    
    @objc
    private func onTapClose() {
        navigationController?.dismiss(animated: true)
    }
}

extension ThirdViewController: PKGInstantiatableController {
    static func create() -> UIViewController & PKGControllerProtocol {
        return ThirdViewController()
    }
    
    static var shouldWrapInNavigationController: Bool {
        return true
    }
    
    static func configure(selfController: UIViewController) {
        selfController.modalPresentationStyle = .formSheet
    }
    
    static func instantiate(bool: Bool) -> UIViewController {
        return instantiate(with: ThirdViewController.package(bool: bool))
    }
}
