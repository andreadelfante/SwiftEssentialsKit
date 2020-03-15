//
//  PKGInstantiatableController.swift
//  SwiftEssentialsKit_Tests
//
//  Created by Andrea Del Fante on 19/02/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
#if SWIFT_PACKAGE
import SwiftEssentialsKit_PackageDTO
#else
import SwiftEssentialsKit
#endif

class PKGMockViewController: UIViewController, PKGControllerProtocol {
    var package: Package?
    
    static var propertiesCallback: ((Package) -> Void)?
    
    func properties(from package: Package) {
        PKGMockViewController.propertiesCallback!(package)
    }
}

extension PKGMockViewController: PKGInstantiatableController {
    static var createCallback: (() -> (UIViewController & PKGControllerProtocol))?
    static var shouldWrapCallback: (() -> Bool)?
    static var configureCallback: ((UIViewController) -> Void)?
    
    static func create() -> UIViewController & PKGControllerProtocol {
        return createCallback!()
    }
    
    static var shouldWrapInNavigationController: Bool {
        return shouldWrapCallback!()
    }
    
    static func configure(selfController: UIViewController) {
        configureCallback!(selfController)
    }
}

class PKGInstantiatableControllerTests: XCTestCase {
    private var package: Package!
    
    override func setUp() {
        super.setUp()
        
        package = Package(action: "ACTION")
        package["KEY"] = 17
    }
    
    func testInstantiate() {
        let expectation = self.expectation(description: name)
        expectation.expectedFulfillmentCount = 4
        
        PKGMockViewController.createCallback = {
            expectation.fulfill()
            return PKGMockViewController()
        }
        
        PKGMockViewController.shouldWrapCallback = {
            expectation.fulfill()
            return true
        }
        
        PKGMockViewController.configureCallback = {
            XCTAssertTrue($0 is PKGNavigationController)
            expectation.fulfill()
        }
        
        PKGMockViewController.propertiesCallback = {
            XCTAssertEqual($0, self.package)
            expectation.fulfill()
        }
        
        let result = PKGMockViewController.instantiate(with: package)
        
        let controller = result as? PKGNavigationController
        XCTAssertNotNil(controller)
        XCTAssertEqual(controller!.package, package)
        
        wait(for: [expectation], timeout: 2)
    }
}
