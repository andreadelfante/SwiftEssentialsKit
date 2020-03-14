//
//  HorizontalSelectionView.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 03/03/2020.
//

import UIKit

/// An object that manages an horizontal list of selectionable content.
public class HorizontalSelectionView: UIView {
    
    /// The object that acts as the delegate of the HorizontalSelectionView.
    public weak var delegate: HorizontalSelectionViewDelegate?
    /// The object that provides the data for the HorizontalSelectionView.
    public weak var dataSource: HorizontalSelectionViewDataSource?
    
    private var cellIdentifier: String?
    private var collectionView: UICollectionView!
    
    override public init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.scrollsToTop = false
        collectionView.canCancelContentTouches = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        
        addConstraint(NSLayoutConstraint(item: collectionView as Any, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: collectionView as Any, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: collectionView as Any, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: collectionView as Any, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0))
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        collectionView.layoutSubviews()
    }
    
    public func reloadData() {
        collectionView.reloadData()
    }
    
    /// Scroll the HorizontalSelectionView to the selected position
    /// - Parameter animated: true with animation, false none.
    public func scrollToSelectedPosition(animated: Bool = true) {
        if let position = selectedPosition {
            scroll(to: position, animated: animated)
        }
    }
    
    /// Scroll the HorizontalSelectionView to a position.
    /// - Parameters:
    ///   - position: the position.
    ///   - animated: true with animation, false none.
    public func scroll(to position: Int, animated: Bool = true) {
        collectionView.scrollToItem(at: IndexPath(row: position, section: 0),
                                    at: .centeredHorizontally,
                                    animated: animated)
    }
    
    /// The selected position.
    public var selectedPosition: Int? {
        willSet {
            guard let position = selectedPosition else { return }
            
            if !collectionView.indexPathsForVisibleItems.isEmpty {
                let indexPath = IndexPath(row: position, section: 0)
                
                let cell = collectionView.cellForItem(at: indexPath)
                cell?.isSelected = false
            }
        }
        didSet {
            if let position = selectedPosition, !collectionView.indexPathsForVisibleItems.isEmpty {
                let indexPath = IndexPath(row: position, section: 0)
                
                let cell = collectionView.cellForItem(at: indexPath)
                cell?.isSelected = true
            }
            
            collectionView.reloadData()
        }
    }
    
    /// Register an HorizontalSelectionViewCell in this HorizontalSelectionView.
    /// - Parameter cell: the cell to register.
    public func register<T: HorizontalSelectionViewCell>(_ cell: T.Type) {
        cellIdentifier = T.identifier
        collectionView.register(T.nib, forCellWithReuseIdentifier: cellIdentifier!)
    }
}

extension HorizontalSelectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.numberOfItems(in: self) ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let identifier = cellIdentifier else {
            fatalError("Please register first a cell")
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HorizontalSelectionViewCell
        cell.isSelected = indexPath.row == selectedPosition
        dataSource?.horizontalSelectionView(self, cell: cell, atPosition: indexPath.row)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPosition = indexPath.row
        delegate?.horizontalSelectionView?(self, didSelectItemAtPosition: indexPath.row)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return delegate?.horizontalSelectionView?(self, sizeForItemAtPosition: indexPath.row) ?? CGSize(width: frame.height, height: frame.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return delegate?.spacingBetweenItems?(in: self) ?? 8.0
    }
    
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return delegate?.spacingBetweenItems?(in: self) ?? 8.0
//    }
}
