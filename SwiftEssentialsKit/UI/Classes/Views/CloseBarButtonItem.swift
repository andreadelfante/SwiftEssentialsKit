//
//  CloseBarButtonItem.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 25/02/2020.
//

#if canImport(UIKit)

import UIKit

/// A bar button item with X icon.
public class CloseBarButtonItem: UIBarButtonItem {

    public override init() {
        super.init()
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    public convenience init(target: Any?, action: Selector?) {
        self.init(image: R.image.ic_close(), style: .plain, target: target, action: action)
        commonInit()
    }

    private func commonInit() {
        accessibilityLabel = R.string.accessibility.actionClose()
    }
}

#endif
