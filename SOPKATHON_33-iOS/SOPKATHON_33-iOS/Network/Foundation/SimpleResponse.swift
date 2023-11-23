//
//  SimpleResponse.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/24.
//

import Foundation

struct SimpleResponse: Codable {
    var code: Int?
    var message: String?
    var data: Data?
    var status: Int?
    var success: Bool?
}
