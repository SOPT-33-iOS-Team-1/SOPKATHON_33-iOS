//
//  MainModel.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/26.
//

import Foundation

struct MainModel: Codable {
    let userID: Int
    let thumbnail: String
    let name, gender: String
    let age: Int
    let criminalHistory, criminalHistoryDate: String
    let volunteerHours, completedProgramCount, certificateCount: Int
    let ringRate: Double

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case thumbnail, name, gender, age, criminalHistory, criminalHistoryDate, volunteerHours, completedProgramCount, certificateCount, ringRate
    }
}
