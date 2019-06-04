//
//  LoginResponse.swift
//  Incluyeme
//
//  Created by Developer on 6/3/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation

struct Service<T: Codable>: Codable {
    var response: T
}
struct loginServiceResponse: Codable {
    var loginResponse: loginResponse
}
struct loginResponse: Codable{
    var status: String
    var message: String
}
