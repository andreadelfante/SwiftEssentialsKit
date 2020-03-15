//
//  CapsuleLabelView.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 02/03/2020.
//

#if canImport(UIKit)

import UIKit

/// A capsule with a label inside.
@IBDesignable
public class CapsuleLabelView: CapsuleView {

    /// The label text.
    @IBInspectable
    public var text: String? {
        get { return label.text }
        set { label.text = newValue }
    }

    /// The label text color.
    @IBInspectable
    public var textColor: UIColor? {
        get { return label.textColor }
        set { label.textColor = newValue }
    }

    private var _fontSize: CGFloat = 17

    /// The label font size.
    @IBInspectable
    public var fontSize: CGFloat {
        get { return _fontSize }
        set {
            _fontSize = newValue
            label.font = UIFont.systemFont(ofSize: newValue)
        }
    }

    private var label: UILabel!

    override func commonInit() {
        super.commonInit()

        label = UILabel()
        label.text = text
        label.textColor = textColor
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: fontSize)

        addSubview(label)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        label.frame = bounds
    }
}

#endif
