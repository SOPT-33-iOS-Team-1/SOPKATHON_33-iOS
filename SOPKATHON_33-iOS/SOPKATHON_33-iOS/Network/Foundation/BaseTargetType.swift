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
        return URL(string: "")
//        return URL(string: Config.baseURL)!
    }
    
    var headers: [String : String]? {
        return APIConstants.noTokenHeader
    }
    
    var validationType: ValidationType {
        return .customCodes(Array(0...500).filter { $0 != 401 } )
    }
}

