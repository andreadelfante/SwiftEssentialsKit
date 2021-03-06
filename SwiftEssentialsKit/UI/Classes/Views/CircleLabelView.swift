//
//  CircleLabelView.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 24/03/2020.
//

#if canImport(UIKit)

import UIKit

/// A circle with a label inside.
@IBDesignable
public class CircleLabelView: CircleView {

    /// The circle text.
    @IBInspectable
    public var text: String? {
        get { return label.text }
        set { label.text = newValue }
    }

    /// The circle text color.
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

    internal var label: UILabel!

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
