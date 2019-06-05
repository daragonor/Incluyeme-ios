



//
//  DonePaymentsViewController.swift
//  Incluyeme
//
//  Created by Developer on 6/4/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

class DonePaymentsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if (!Utils.checkInternetConnection()){
            Utils.internetAlert(self)
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }

}
