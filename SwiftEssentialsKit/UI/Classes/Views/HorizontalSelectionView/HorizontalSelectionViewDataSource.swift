//
//  HorizontalSelectionViewDataSource.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 03/03/2020.
//

#if canImport(UIKit)

import UIKit

/// An object that adopts the HorizontalSelectionViewDataSource protocol is responsible for providing the data and views required by a horizontal view.
/// A data source object represents your app’s data model and vends information to the horizontal view as needed.
/// It also handles the creation and configuration of cells and supplementary views used by the horizontal view to display your data.
public protocol HorizontalSelectionViewDataSource: class {
    /// Asks your data source object for the number of items in the specified section.
    /// - Parameter horizontalSelectionView: the horizontal view.
    /// - Returns: the number of items.
    func numberOfItems(in horizontalSelectionView: HorizontalSelectionView) -> Int

    /// Asks your data source object for the cell that corresponds to the specified item in the horizontal view.
    /// - Parameters:
    ///   - horizontalSelectionView: the horizontal view.
    ///   - cell: the cell to configure.
    ///   - position: the position that specifies the location of the item.
    func horizontalSelectionView(_ horizontalSelectionView: HorizontalSelectionView, cell: HorizontalSelectionViewCell, atPosition position: Int)
}

#endif
