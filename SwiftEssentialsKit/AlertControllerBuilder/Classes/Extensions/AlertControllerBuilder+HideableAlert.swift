//
//  AlertControllerBuilder+HideableAlert.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 20/02/2020.
//

import UIKit

extension UIAlertController: HideableAlert {
    public func hide(animated: Bool, completion: HideableAlert.HideCompletion?) {
        dismiss(animated: animated, completion: completion)
    }
}
