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
    }
    
    @IBAction func proceedAction(_ sender: Any) {
        if (!Utils.checkInternetConnection()){
            let viewController = self.storyboard!.instantiateViewController(withIdentifier: "InternetAlertViewController")
            viewController.definesPresentationContext = true
            viewController.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
            viewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(viewController,animated: true, completion: {
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
                    exit(0)
                })
            })
        }else{
            performSegue(withIdentifier: "HomeSegue", sender: nil)
        }
    }
    
}
