//
//  CoursesResponse.swift
//  Incluyeme
//
//  Created by Developer on 6/3/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation

struct CourseBodyResponse: Codable{
    var courseList : [CourseResponse]
}

struct CourseResponse: Codable{
    var itemTypeDescription: String
    var courseCodeDisplay: String
    var codModalEst: String
    var codProducto: String
    var codLineaNegocio: String
    var courseGroup: String
    var courseNC: String
    var courseName: String
    var itemType: Int
    var coursePeriod: String
    var courseSection: String
    var courseCode: String
}
