//
//  WelcomeViewController.swift
//  Yippy
//
//  Created by Matthew Davidson on 11/9/19.
//  Copyright © 2019 MatthewDavidson. All rights reserved.
//

import Foundation
import Cocoa

class WelcomeViewController: NSViewController {
    
    @IBOutlet var allowAccessButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allowAccessButton.setAccessibilityIdentifier(Accessibility.identifiers.welcomeAllowAccessButton)
    }
    
    @IBAction func allowAccessTapped(_ sender: Any) {
        State.main.allowAccessTapped = true
        self.view.window?.performClose(sender)
        State.main.helpWindowController?.showWindow(sender)
        _ = Helper.isControlGranted(showPopup: true)
    }
}
