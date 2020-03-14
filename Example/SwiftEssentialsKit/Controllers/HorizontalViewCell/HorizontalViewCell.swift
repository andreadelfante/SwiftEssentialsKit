//
//  HorizontalViewCell.swift
//  SwiftEssentialsKit_Example
//
//  Created by Andrea Del Fante on 14/03/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import SwiftEssentialsKit

class HorizontalViewCell: HorizontalSelectionViewCell {
    static let identifier: String = "HorizontalViewCell"
    static let nib: UINib = UINib(nibName: "HorizontalViewCell", bundle: Bundle.main)
    
    @IBOutlet weak var capsuleLabelView: CapsuleLabelView!
}
