//
//  AuthorizationViewController.swift
//  Incluyeme
//
//  Created by Developer on 6/3/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

class AuthorizationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (!Utils.checkInternetConnection()){
            let viewController = self.storyboard!.instantiateViewController(withIdentifier: "InternetAlertViewController")
            viewController.definesPresentationContext = true
            viewController.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
            viewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(viewController,animated: true, completion: nil)
        }
    }
    
    @IBAction func proceedAction(_ sender: Any) {
        performSegue(withIdentifier: "HomeSegue", sender: nil)
    }
    
}
