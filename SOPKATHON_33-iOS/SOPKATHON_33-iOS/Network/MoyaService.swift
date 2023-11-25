//
//  MoyaService.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/26.
//

import Foundation

import Moya
import UIKit

enum MoyaService {
    case getMainData
    case getGelationData
    case getProgramData(type: String)
    case getProgramDetailData(id: Int)
}

extension MoyaService: BaseTargetType {
    var path: String {
        switch self {
        case .getMainData:
            return "/api/v1/user/info/\(1)"
        case .getGelationData:
            return "/api/v1/user/info/detail/\(1)"
        case .getProgramData:
            return "/api/v1/program"
        case .getProgramDetailData:
            return "/api/v1/program/detail"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMainData:
            return .get
        case .getGelationData:
            return .get
        case .getProgramData:
            return .get
        case .getProgramDetailData:
            return .get
        }
    }
    
    
    var task: Task {
        switch self {
        case .getMainData:
            return .requestPlain
        case .getGelationData:
            return .requestPlain
        case .getProgramData(let type):
            return .requestParameters(parameters: ["program_type": type], encoding: URLEncoding.default)
        case .getProgramDetailData(let id):
            return .requestParameters(parameters: ["programId": id], encoding: URLEncoding.default)
        }
    }
}

