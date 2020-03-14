//
//  AlertControllerBuilder.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 19/02/2020.
//

import UIKit

/// A builder to create an alert.
public class AlertControllerBuilder {
    internal let style: UIAlertController.Style

    internal var title: String?
    internal var message: String?
    internal var actions: [UIAlertAction]
    
    internal var textFields: [AlertBuilder.TextFieldBuilder]
    internal var textFieldValues: [String: String]
    internal var validators: [UIAlertAction: AlertBuilder.ValidatorBlock]
    
    internal var barButtonItem: UIBarButtonItem?
    internal var sourceRect: CGRect?
    
    internal init(style: UIAlertController.Style) {
        self.style = style
        self.actions = []
        
        self.textFields = []
        self.textFieldValues = [:]
        self.validators = [:]
    }
}
