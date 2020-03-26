//
//  AvatarView.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 26/02/2020.
//

#if canImport(UIKit)

import UIKit

/// A view user's avatar.
@IBDesignable
public class AvatarView: CircleLabelView {

    /// The user's avatar.
    @IBInspectable
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

    /// The user's name initials.
    @IBInspectable
    public var initials: String? {
        get { return text }
        set { text = newValue }
    }

    private var imageView: UIImageView!

    override func commonInit() {
        super.commonInit()
        
        imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.isHidden = true

        addSubview(imageView)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        imageView.frame = bounds
        imageView.layer.cornerRadius = bounds.size.width / 2
    }
}

#endif
