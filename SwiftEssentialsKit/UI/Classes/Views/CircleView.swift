//
//  CircleView.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 24/03/2020.
//

#if canImport(UIKit)

import UIKit

/// A circle.
@IBDesignable
public class CircleView: UIView {
    
    /// The circle color.
    @IBInspectable
    public var color: UIColor? {
        get {
            guard let cgColor = shapeLayer.fillColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
        set {
            CATransaction.begin()
            CATransaction.setDisableActions(!withAnimation)
            shapeLayer.fillColor = newValue?.cgColor
            CATransaction.commit()
        }
    }
    
    /// Set if this view should use animation to change its look.
    @IBInspectable
    public var withAnimation: Bool = true
    
    internal var shapeLayer: CAShapeLayer!

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

        let size = min(bounds.width, bounds.height)
        let rect = CGRect(x: (bounds.width / 2) - (size / 2),
                          y: (bounds.height / 2) - (size / 2),
                          width: size,
                          height: size)
        shapeLayer!.path = UIBezierPath(ovalIn: rect).cgPath
    }

    public override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)

        backgroundColor = .clear
    }
}

#endif
