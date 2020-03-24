//
//  DividerView.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 24/03/2020.
//

#if canImport(UIKit)

import UIKit

/// A divider.
public enum DividerViewPosition: Int {
    case bottom = 0
    case top = 1
    case left = 2
    case right = 3
}

@IBDesignable
public class DividerView: UIView {
    
    /// The divider position.
    public var position: DividerViewPosition = .bottom {
        didSet {
            shapeLayer.setNeedsDisplay()
        }
    }
    
    /// The divider position in raw value for IBInspectable.
    @IBInspectable
    public var positionRaw: Int {
        get { return position.rawValue }
        set { position = DividerViewPosition(rawValue: newValue) ?? .bottom }
    }
    
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
        
        if #available(iOS 13.0, *) {
            shapeLayer.fillColor = UIColor.separator.cgColor
        } else {
            shapeLayer.fillColor = UIColor.lightGray.cgColor
        }

        layer.addSublayer(shapeLayer)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        shapeLayer!.path = UIBezierPath(rect: dividerRect).cgPath
    }

    public override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)

        backgroundColor = .clear
    }
    
    private var dividerRect: CGRect {
        switch position {
        case .bottom:
            return CGRect(x: bounds.origin.x, y: bounds.origin.y + (bounds.height - dividerSize), width: bounds.width, height: dividerSize)
        case .top:
            return CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width, height: dividerSize)
        case .right:
            return CGRect(x: bounds.origin.x + (bounds.width - dividerSize), y: bounds.origin.y, width: dividerSize, height: bounds.height)
        case .left:
            return CGRect(x: bounds.origin.x, y: bounds.origin.y, width: dividerSize, height: bounds.height)
        }
    }
    
    private var dividerSize: CGFloat {
        return 1.0 / UIScreen.main.scale
    }
}

#endif
