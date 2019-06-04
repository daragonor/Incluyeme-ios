//
//  LoginResponse.swift
//  Incluyeme
//
//  Created by Developer on 6/3/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation

struct Response<T: Codable>: Codable {
    var response: T
}
struct LoginBodyResponse: Codable {
    var loginResponse: LoginResponse
}
struct LoginResponse: Codable{
    var status: String
    var message: String
}
