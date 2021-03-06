//
//  LogInViewController.swift
//  TwitterClient
//
//  Created by Ahmed Elassuty on 12/23/16.
//  Copyright © 2016 Eventtus. All rights reserved.
//

import UIKit
import TwitterKit

/**
 LoginViewController handles the logIn screen logic.
 */
class LogInViewController: BaseViewController {
    
    // Twitter LogIn Button
    @IBOutlet weak var logInButton: TWTRLogInButton!
    
    // MARK: Overrides
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.logInCompletion = logInCompletion
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
