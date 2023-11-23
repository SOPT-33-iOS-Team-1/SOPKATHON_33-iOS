//
//  GenericResponse.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/24.
//

import Foundation

struct GenericResponse<T: Codable>: Codable {
    var status: Int?
    var success: Bool?
    var code: Int?
    var message: String?
    var data: T?
}
