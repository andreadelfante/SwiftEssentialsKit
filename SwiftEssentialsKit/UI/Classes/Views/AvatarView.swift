//
//  AvatarView.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 26/02/2020.
//

import UIKit

@IBDesignable
/// A view user's avatar.
public class AvatarView: UIView {
    
    @IBInspectable
    /// The user's avatar.
    public var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            if let image = newValue {
                imageView.image = image
                imageView.isHidden = false
                shapeLayer.isHidden = true
                label.isHidden = true
            } else {
                imageView.image = nil
                imageView.isHidden = true
                shapeLayer.isHidden = false
                label.isHidden = false
            }
        }
    }
    
    @IBInspectable
    /// The user's name initials.
    public var initials: String? {
        get { return label.text }
        set { label.text = newValue }
    }
    
    @IBInspectable
    /// The color of this view if image is missing.
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
    
    private var _fontSize: CGFloat = 17
    
    @IBInspectable
    /// The font size of user's name initials.
    public var fontSize: CGFloat {
        get { return _fontSize }
        set {
            _fontSize = newValue
            label.font = UIFont.systemFont(ofSize: newValue)
        }
    }
    
    private var imageView: UIImageView!
    private var label: UILabel!
    private var shapeLayer: CAShapeLayer!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.isHidden = true
        
        label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.isAccessibilityElement = false
        label.isHidden = false
        
        shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = color?.cgColor
        shapeLayer.isHidden = false
        
        addSubview(imageView)
        layer.addSublayer(shapeLayer)
        addSubview(label)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = bounds
        imageView.layer.cornerRadius = bounds.size.width / 2
        label.frame = bounds
        
        shapeLayer!.path = UIBezierPath(ovalIn: bounds).cgPath
    }
    
    public override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        
        backgroundColor = .clear
    }
}
