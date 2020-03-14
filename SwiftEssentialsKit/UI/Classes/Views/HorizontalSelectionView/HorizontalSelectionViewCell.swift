//
//  HorizontalSelectionViewCell.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 03/03/2020.
//

import UIKit

/// HorizontalSelectionViewCell type.
public typealias HorizontalSelectionViewCell = UICollectionViewCell & HorizontalSelectionViewCellProvider

/// This protocol provides some cell properties, like an identifier and its associated nib.
public protocol HorizontalSelectionViewCellProvider {
    /// The cell identifier to recycle the cell.
    static var identifier: String { get }
    
    /// Its associated nib.
    static var nib: UINib { get }
}
