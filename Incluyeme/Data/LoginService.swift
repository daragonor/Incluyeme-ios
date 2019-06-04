//
//  LoginService.swift
//  Incluyeme
//
//  Created by Developer on 6/3/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation

extension IncluyemeAPI{
    static public func login(responseHandler: @escaping (Response<LoginBodyResponse>) -> (Void)){
        self.service(method: .post,
                     urlString: IncluyemeURL.login,
                     headers: [:],
                     body: nil,
                     responseType: Response.self,
                     responseHandler: responseHandler
        )
    }
    static public func getSchedule(responseHandler: @escaping (Response<ScheduleBodyResponse>) -> (Void)){
        self.service(method: .post,
                     urlString: IncluyemeURL.login,
                     headers: [:],
                     body: nil,
                     responseType: Response.self,
                     responseHandler: responseHandler
        )
    }
    
    static public func getCourses(responseHandler: @escaping (Response<CourseBodyResponse>) -> (Void)){
        self.service(method: .post,
                     urlString: IncluyemeURL.login,
                     headers: [:],
                     body: nil,
                     responseType: Response.self,
                     responseHandler: responseHandler
        )
    }
}
