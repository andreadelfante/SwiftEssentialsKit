//
//  AlertControllerBuilder+AlertBuilder.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 20/02/2020.
//

#if canImport(UIKit)

import UIKit

extension AlertControllerBuilder: AlertBuilder {

    public func addAction(defaultType title: String, validate: @escaping AlertControllerBuilder.ValidatorBlock, handler: @escaping AlertControllerBuilder.ActionValuesHandler) -> Self {
        return add(validator: validate,
                   for: UIAlertAction(title: title, style: .default, handler: { handler($0, self.textFieldValues) }))
    }

    public func addAction(cancelType title: String, validate: @escaping AlertControllerBuilder.ValidatorBlock, handler: @escaping AlertControllerBuilder.ActionValuesHandler) -> Self {
        return add(validator: validate,
                   for: UIAlertAction(title: title, style: .cancel, handler: { handler($0, self.textFieldValues) }))
    }

    public func addAction(destructiveType title: String, validate: @escaping AlertControllerBuilder.ValidatorBlock, handler: @escaping AlertControllerBuilder.ActionValuesHandler) -> Self {
        return add(validator: validate,
                   for: UIAlertAction(title: title, style: .destructive, handler: { handler($0, self.textFieldValues) }))
    }

    public func add(textField key: String, configuration: @escaping AlertBuilder.TextFieldBuilder) -> Self {
        textFields.append { (textField) in
            configuration(textField)

            NotificationCenter.default
                .addObserver(forName: UITextField.textDidChangeNotification, object: textField, queue: .main, using: { _ in
                    if let text = textField.text {
                        self.textFieldValues[key] = text
                    }

                    self.validateAll()
                })
        }
        return self
    }

    internal func validateAll() {
        actions.forEach { (action) in
            action.isEnabled = validators[action]?(self.textFieldValues) ?? true
        }
    }

    internal func add(validator: @escaping ValidatorBlock, for action: UIAlertAction) -> Self {
        _ = addAction(builder: { action })
        validators[action] = validator
        return self
    }
}

#endif
