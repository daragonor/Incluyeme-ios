//
//  GradesResponse.swift
//  Incluyeme
//
//  Created by Developer on 6/4/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation

struct GradesBodyResponse: Codable {
    var responseGradesList: GradesListResponse
}

struct GradesListResponse: Codable{
    var percentProgress: String
    var descFormula: String
    var list: [GradeResponse]
}

struct GradeResponse: Codable {
    var descFormula: String?
    var average: String?
    var cellId: String?
    var percentProgress: String?
    var PesoPonderado: String?
    var color: String?
    var NumPrueba: String?
    var CodTipoPrueba: String?
    var Nota: String?
    var DesTipoPrueba: String?
}
