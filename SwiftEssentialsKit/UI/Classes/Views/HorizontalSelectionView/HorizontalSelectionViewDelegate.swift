//
//  HorizontalSelectionViewDelegate.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 03/03/2020.
//

import UIKit

@objc
/// The HorizontalSelectionViewDelegate protocol defines methods that allow you to manage the selection, size and spacing of items.
/// The methods of this protocol are all optional.
public protocol HorizontalSelectionViewDelegate: class {
    
    /// Tells the delegate that the item at the specified position was selected.
    /// - Parameters:
    ///   - horizontalSelectionView: the horizontal view.
    ///   - position: the position of the item.
    @objc optional func horizontalSelectionView(_ horizontalSelectionView: HorizontalSelectionView, didSelectItemAtPosition position: Int)
    
    /// Asks the delegate for the size of the specified item’s cell.
    /// - Parameters:
    ///   - horizontalSelectionView: the horizontal view.
    ///   - position: the position of the item.
    /// - Returns: the size of the item cell.
    @objc optional func horizontalSelectionView(_ horizontalSelectionView: HorizontalSelectionView, sizeForItemAtPosition position: Int) -> CGSize
    
    /// Asks the delegate for the spacing between items.
    /// - Parameter horizontalSelectionView: the horizontal view.
    /// - Returns: the spacing value.
    @objc optional func spacingBetweenItems(in horizontalSelectionView: HorizontalSelectionView) -> CGFloat
}
