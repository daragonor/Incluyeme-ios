//
//  LoginService.swift
//  Incluyeme
//
//  Created by Developer on 6/3/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation

extension IncluyemeAPI{
    static public func login(responseHandler: @escaping (Service<loginServiceResponse>) -> (Void)){
        self.service(method: .post,
                     urlString: IncluyemeURL.login,
                     headers: [:],
                     body: nil,
                     responseType: Service.self,
                     responseHandler: responseHandler
        )
    }
    static public func getCourses(responseHandler: @escaping (Service<loginServiceResponse>) -> (Void)){
        self.service(method: .post,
                     urlString: IncluyemeURL.login,
                     headers: [:],
                     body: nil,
                     responseType: Service.self,
                     responseHandler: responseHandler
        )
    }
}
