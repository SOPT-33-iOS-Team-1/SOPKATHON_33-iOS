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
}

extension MoyaService: BaseTargetType {
    var path: String {
        switch self {
        case .getMainData:
            return "/api/v1/user/info/\(1)"
        case .getGelationData:
            return "/api/v1/user/info/detail/\(1)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMainData:
            return .get
        case .getGelationData:
            return .get
        }
    }
    
    
    var task: Task {
        switch self {
        case .getMainData:
            return .requestPlain
        case .getGelationData:
            return .requestPlain
        }
    }
}

