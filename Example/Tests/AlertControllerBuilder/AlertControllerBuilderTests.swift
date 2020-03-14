//
//  AlertControllerBuilderTests.swift
//  SwiftEssentialsKit_Tests
//
//  Created by Andrea Del Fante on 19/02/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import SwiftEssentialsKit

class AlertControllerBuilderTests: XCTestCase {
    private let title = "CUSTOM_TITLE"
    private let message = "CUSTOM_MESSAGE"
    private let actionCancel = UIAlertAction(title: "CUSTOM_ACTION_CANCEL", style: .cancel, handler: nil)
    private let actionDestructive = UIAlertAction(title: "CUSTOM_ACTION_DESTRUCTIVE", style: .destructive, handler: nil)
    private let actionDefault = UIAlertAction(title: "CUSTOM_ACTION_DEFAULT", style: .default, handler: nil)
    private let anchor = CGRect()
    
    func testBuildAlert() {
        let expected = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let result = AlertControllerBuilder.alert
            .title(title)
            .message(message)
            .build()
        
        XCTAssertEqual(result.preferredStyle, expected.preferredStyle)
        XCTAssertEqual(result.title, expected.title)
        XCTAssertEqual(result.message, expected.message)
    }
    
    func testBuildSheet() {
        let expected = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let result = AlertControllerBuilder.sheet(anchor)
            .title(title)
            .message(message)
            .build()
        
        XCTAssertEqual(result.preferredStyle, expected.preferredStyle)
        XCTAssertEqual(result.title, expected.title)
        XCTAssertEqual(result.message, expected.message)
    }
    
    func testBuildAlertWithActions() {
        let expected = UIAlertController(title: title, message: message, preferredStyle: .alert)
        expected.addAction(actionCancel)
        expected.addAction(actionDestructive)
        expected.addAction(actionDefault)
        
        let result = AlertControllerBuilder.alert
            .title(title)
            .message(message)
            .addAction(builder: { actionCancel })
            .addAction(builder: { actionDestructive })
            .addAction(builder: { actionDefault })
            .build()
        
        XCTAssertEqual(result.preferredStyle, expected.preferredStyle)
        XCTAssertEqual(result.title, expected.title)
        XCTAssertEqual(result.message, expected.message)
        XCTAssertEqual(result.actions, expected.actions)
    }
    
    func testBuildSheetWithActions() {
        let expected = UIAlertController(title: title, message: message, preferredStyle: .alert)
        expected.addAction(actionCancel)
        expected.addAction(actionDestructive)
        expected.addAction(actionDefault)
        
        let result = AlertControllerBuilder.alert
            .title(title)
            .message(message)
            .addAction(builder: { actionCancel })
            .addAction(builder: { actionDestructive })
            .addAction(builder: { actionDefault })
            .build()
        
        XCTAssertEqual(result.preferredStyle, expected.preferredStyle)
        XCTAssertEqual(result.title, expected.title)
        XCTAssertEqual(result.message, expected.message)
        XCTAssertEqual(result.actions, expected.actions)
    }
    
    func testBuildAlertWithActionsAndTextFields() {
        let expected = UIAlertController(title: title, message: message, preferredStyle: .alert)
        expected.addAction(actionCancel)
        expected.addAction(actionDestructive)
        expected.addAction(actionDefault)
        expected.addTextField(configurationHandler: { $0.text = "CUSTOM_TEXT" })
        
        let result = AlertControllerBuilder.alert
            .title(title)
            .message(message)
            .add(textField: "KEY", configuration: { $0.text = "CUSTOM_TEXT" })
            .addAction(builder: { actionCancel })
            .addAction(destructiveType: actionDestructive.title!, validate: { (_) -> Bool in
                return false
            }, handler: { (_, _) in
                
            })
            .addAction(defaultType: actionDefault.title!, validate: { (_) -> Bool in
                return false
            }, handler: { (_, _) in
                
            })
            .build()
        
        XCTAssertEqual(result.preferredStyle, expected.preferredStyle)
        XCTAssertEqual(result.title, expected.title)
        XCTAssertEqual(result.message, expected.message)
        XCTAssertEqual(result.actions.map { $0.title }, expected.actions.map { $0.title })
        XCTAssertEqual(result.textFields?.map { $0.text }, expected.textFields?.map { $0.text })
        
        let resultActionCancel = try! XCTUnwrap(result.actions.first { $0.style == .cancel })
        let resultActionDestructive = try! XCTUnwrap(result.actions.first { $0.style == .destructive })
        let resultActionDefault = try! XCTUnwrap(result.actions.first { $0.style == .default })
        
        XCTAssertTrue(resultActionCancel.isEnabled)
        XCTAssertFalse(resultActionDestructive.isEnabled)
        XCTAssertFalse(resultActionDefault.isEnabled)
    }
}
