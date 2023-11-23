//
//  APIConstant.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/24.
//

import Foundation
import Moya

struct APIConstants{
    
    static let contentType = "Content-Type"
    static let applicationJSON = "application/json"
    static let multipartFormData = "multipart/form"
    static let auth = "Authorization"
    static let refresh = "RefreshToken"
    static let fcm = "FcmToken"
    
}

extension APIConstants{
    
    static var noTokenHeader: Dictionary<String,String> {
        [contentType: applicationJSON]
    }
    
//    static var hasTokenHeader: Dictionary<String,String> {
//        [contentType: applicationJSON,
//               auth : UserDefaultsManager.zoocAccessToken]
//    }
//    
//    static var multipartHeader: Dictionary<String,String> {
//        [contentType: multipartFormData,
//               auth : UserDefaultsManager.zoocAccessToken]
//    }
//    
//    static var refreshHeader: Dictionary<String,String> {
//        [contentType: applicationJSON,
//               auth : UserDefaultsManager.zoocAccessToken,
//             refresh: UserDefaultsManager.zoocRefreshToken,
//                 fcm: UserDefaultsManager.fcmToken]
//    }
}
