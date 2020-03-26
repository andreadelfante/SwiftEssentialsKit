//
//  RectangleView.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 03/03/2020.
//

#if canImport(UIKit)

import UIKit

/// A rectangle.
@IBDesignable
public class RectangleView: UIView {

    /// The rectangle color.
    @IBInspectable
    public var color: UIColor? {
        get {
            guard let cgColor = shapeLayer.fillColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
        set {
            CATransaction.begin()
            CATransaction.setDisableActions(withAnimation)
            shapeLayer.fillColor = newValue?.cgColor
            CATransaction.commit()
        }
    }

    /// The  rectangle corner radius.
    @IBInspectable
    public var cornerRadius: CGFloat = 0 {
        didSet {
            shapeLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        }
    }
    
    /// Set if this view should use animation to change its look.
    @IBInspectable
    public var withAnimation: Bool = true

    private var shapeLayer: CAShapeLayer!

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    internal func commonInit() {
        shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = color?.cgColor

        layer.addSublayer(shapeLayer)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        shapeLayer!.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }

    public override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)

        backgroundColor = .clear
    }
}

#endif
