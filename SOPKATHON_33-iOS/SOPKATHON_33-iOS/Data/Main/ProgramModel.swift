//
//  ProgramModel.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/26.
//

import Foundation

// MARK: - Datum
struct ProgramModel: Codable {
    let programID: Int
    let title, registerAt, imageURL, status: String
    let region: String

    enum CodingKeys: String, CodingKey {
        case programID = "program_id"
        case title
        case registerAt = "register_at"
        case imageURL = "image_url"
        case status, region
    }
}
