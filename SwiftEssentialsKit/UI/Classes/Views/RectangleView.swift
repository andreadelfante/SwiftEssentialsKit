//
//  RectangleView.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 03/03/2020.
//

import UIKit

@IBDesignable
/// A rectangle.
public class RectangleView: UIView {
    
    @IBInspectable
    /// The rectangle color.
    public var color: UIColor? {
        get {
            guard let cgColor = shapeLayer.fillColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
        set {
            shapeLayer.fillColor = newValue?.cgColor
            shapeLayer.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    /// The  rectangle corner radius.
    public var cornerRadius: CGFloat = 0 {
        didSet {
            shapeLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shapeLayer.setNeedsDisplay()
        }
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
