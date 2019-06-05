//
//  Utils.swift
//  Incluyeme
//
//  Created by Developer on 6/4/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation

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
}
