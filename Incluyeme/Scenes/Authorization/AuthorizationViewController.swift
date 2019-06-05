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
            Utils.internetAlert(self)
        }else{
            performSegue(withIdentifier: "HomeSegue", sender: nil)
        }
    }
    
}
