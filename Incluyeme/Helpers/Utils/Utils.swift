//
//  Utils.swift
//  Incluyeme
//
//  Created by Developer on 6/4/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation
import UIKit

class Utils{
    static func checkInternetConnection() -> Bool{
        var flag = false
        let reachability = Reachability()!
        
        switch reachability.connection {
        case .wifi, .cellular:
            flag = true
        case .none:
            flag = false
        }
        return flag
    }
    static func internetAlert(_ origin: UIViewController){
        let viewController = origin.storyboard!.instantiateViewController(withIdentifier: "InternetAlertViewController")
        viewController.definesPresentationContext = true
        viewController.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        viewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        origin.present(viewController,animated: true, completion: {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
                exit(0)
            })
        })
    }
}
