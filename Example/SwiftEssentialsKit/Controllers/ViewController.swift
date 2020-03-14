//
//  ViewController.swift
//  SwiftEssentialsKit
//
//  Created by Andrea Del Fante on 02/19/2020.
//  Copyright (c) 2020 Andrea Del Fante. All rights reserved.
//

import UIKit
import SwiftEssentialsKit

class ViewController: PKGTableViewController {
    
    @IBOutlet private weak var relativeTimeLabel: RelativeTimeLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        relativeTimeLabel.prefix = "Last update:"
        relativeTimeLabel.referenceDate = Date()
    }

    @IBAction
    private func onTapPassToStoryboardController() {
        navigationController?.pushViewController(SecondViewController.instantiate(text: "SUCCESS"),
                                                 animated: true)
    }
    
    @IBAction
    private func onTapPassToCodeController() {
        present(ThirdViewController.instantiate(bool: true), animated: true)
    }
    
    @IBAction
    private func onTapShowSimpleDialog() {
        AlertControllerBuilder.alert
            .title("TITLE")
            .message("MESSAGE")
            .addAction(defaultType: "OK")
            .show(in: self)
    }
    
    @IBAction
    private func onTapShowDialogWithTextField() {
        AlertControllerBuilder.alert
            .title("TITLE")
            .message("MESSAGE")
            .add(textField: "KEY")
            .addAction(defaultType: "OK", validate: { (values) -> Bool in
                return !(values["KEY"] ?? "").isEmpty
            }, handler: { (_, values) in
                let key = values["KEY"] ?? "ERROR-SOMETHING-WENT-WRONG"
                
                AlertControllerBuilder.alert
                    .title(key)
                .addAction(defaultType: "OK")
                .show(in: self)
            })
            .addAction(destructiveType: "DELETE")
            .addAction(cancelType: "CANCEL")
            .show(in: self)
    }
    
    @IBAction
    private func onTapShowDialogWithDelayedDismiss() {
        let alert = AlertControllerBuilder.alert
            .title("TITLE")
            .message("MESSAGE")
            .show(in: self)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            alert.hide()
        }
    }
    
    @IBAction
    private func onTapViews() {
        navigationController?.pushViewController(ViewsViewController.instantiate(), animated: true)
    }
}

extension ViewController: PKGInstantiatableStoryboard {
    static var storyboardSource: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    static var storyboardIdentifier: String = "ViewControllerId"
}
