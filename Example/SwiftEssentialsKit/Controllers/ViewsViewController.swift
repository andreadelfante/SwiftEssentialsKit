//
//  ViewsViewController.swift
//  SwiftEssentialsKit_Example
//
//  Created by Andrea Del Fante on 14/03/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SwiftEssentialsKit

class ViewsViewController: PKGViewController {
    @IBOutlet weak var horizontalSelectionView: HorizontalSelectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        horizontalSelectionView.delegate = self
        horizontalSelectionView.dataSource = self
        
        horizontalSelectionView.register(HorizontalViewCell.self)
    }
}

extension ViewsViewController: HorizontalSelectionViewDelegate, HorizontalSelectionViewDataSource {
    func numberOfItems(in horizontalSelectionView: HorizontalSelectionView) -> Int {
        return 10
    }
    
    func horizontalSelectionView(_ horizontalSelectionView: HorizontalSelectionView, cell: HorizontalSelectionViewCell, atPosition position: Int) {
        let cell = cell as! HorizontalViewCell
        
        cell.capsuleLabelView.text = position.asString
        if cell.isSelected {
            cell.capsuleLabelView.color = .black
            cell.capsuleLabelView.textColor = .white
        } else {
            cell.capsuleLabelView.color = .red
            cell.capsuleLabelView.textColor = .black
        }
    }
}

extension ViewsViewController: PKGInstantiatableStoryboard {
    static var storyboardSource: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    static var storyboardIdentifier: String = "ViewsViewControllerId"
}
