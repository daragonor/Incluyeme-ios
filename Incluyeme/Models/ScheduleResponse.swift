//
//  ScheduleResponse.swift
//  Incluyeme
//
//  Created by Developer on 6/4/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation

struct ScheduleBodyResponse: Codable {
    var scheduleResponse: ScheduleResponse
}

struct ScheduleResponse: Codable {
    var detail: ScheduleDetailResponse
}

struct ScheduleDetailResponse: Codable {
    var classes: [ScheduleClassesResponse]
}

struct ScheduleClassesResponse: Codable {
    var startTime: String
    var classroom: String
    var courseName: String
    var day: String
    var column: String
    var row: Int
    var backgroundColor: String
    var campus: String
    var endTime: String
    var multipleItemPosition: String
    var modules: Int
    var multipleItem: String
    var classroomType: String
    var professorName: String
    var courseId: String
}
