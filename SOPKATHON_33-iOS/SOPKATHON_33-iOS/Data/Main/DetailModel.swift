//
//  DetailModel.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/26.
//
//
struct DetailModel: Codable {
    let imageURL, content, organizationName, registerAt: String
    let salary: Int?
    let hour: Int?
    let isApply: Bool
    let programType: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case content
        case organizationName
        case registerAt
        case salary
        case hour
        case isApply
        case programType
    }
}
