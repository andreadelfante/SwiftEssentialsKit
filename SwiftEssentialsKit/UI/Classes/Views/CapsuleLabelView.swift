//
//  CapsuleLabelView.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 02/03/2020.
//

import UIKit

@IBDesignable
/// A capsule with a label inside.
public class CapsuleLabelView: CapsuleView {
    
    @IBInspectable
    /// The label text.
    public var text: String? {
        get { return label.text }
        set { label.text = newValue }
    }
    
    @IBInspectable
    /// The label text color.
    public var textColor: UIColor? {
        get { return label.textColor }
        set { label.textColor = newValue }
    }
    
    private var _fontSize: CGFloat = 17
    
    @IBInspectable
    /// The label font size.
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
