//
//  BaseViewController.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/26.
//

import Foundation

import UIKit

class BaseViewController: UIViewController {
    
    @discardableResult
    func validateResult(_ result: NetworkResult<Any>) -> Any?{
        switch result{
        case .success(let data):
            print("성공했습니다.")
            print(data)
            return data
        case .requestErr(let message):
            return message
            break
            //showToast(message, type: .bad)
        case .pathErr:
            print("path 혹은 method 오류입니다.")
        case .serverErr:
            
            print("서버 내 오류입니다.")
        case .networkFail:
            print("네트워크가 불안정합니다.")
        case .decodedErr:
            print("디코딩 오류가 발생했습니다.")
        case .authorizationFail(_):
            print("인증 오류가 발생했습니다. 다시 로그인해주세요")
        }
        return nil
    }
}
