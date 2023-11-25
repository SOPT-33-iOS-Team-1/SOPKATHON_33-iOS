//
//  BaseTargetType.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/24.
//

import Foundation
import Moya

protocol BaseTargetType: TargetType{ }

extension BaseTargetType{
    
    var baseURL: URL {
        return URL(string: "http://15.164.195.223:8080")!
//        return URL(string: Config.baseURL)!
    }
    
    var headers: [String : String]? {
        return APIConstants.noTokenHeader
    }
    
    var validationType: ValidationType {
        return .customCodes(Array(0...500).filter { $0 != 401 } )
    }
}

