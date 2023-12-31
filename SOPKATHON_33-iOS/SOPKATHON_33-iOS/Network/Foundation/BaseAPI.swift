//
//  BaseAPI.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/24.
//

import Foundation

import Moya

class BaseAPI{
    private func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<T>.self, from: data)
        else {
            print("⛔️ \(self)애서 디코딩 오류가 발생했습니다 ⛔️")
            return .decodedErr
        }
        
        switch statusCode {
        case 200..<205:
            guard decodedData.data != nil else {
                print("⛔️ \(self)애서 디코딩 오류가 발생했습니다 ⛔️")
                return .decodedErr
            }
            return .success(decodedData.data as Any)
        case 406:
            return .authorizationFail((decodedData.message, decodedData.status))
        case 400..<500:
            return .requestErr(decodedData.message ?? "요청에러")
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func judgeSimpleResponseStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SimpleResponse.self, from: data)
        else {
            print("⛔️ \(self)애서 디코딩 오류가 발생했습니다 ⛔️")
            return .decodedErr
        }
        
        switch statusCode {
        case 200..<205:
            return .success(decodedData)
        case 406:
            return .authorizationFail((decodedData.message, decodedData.status))
        case 400..<500:
            return .requestErr(decodedData.message ?? "요청에러")
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    public func disposeNetwork<T: Codable>(_ result: Result<Response, MoyaError>,
                                    dataModel: T.Type,
                                    completion: @escaping (NetworkResult<Any>) -> Void) {
        print("📍\(#function) 에서 result \(result)")
        switch result{
        case .success(let response):
            let statusCode = response.statusCode
            let data = response.data
            
//            if dataModel == String.self {
//                guard let data = String(data: data, encoding: .utf8) else {
//                    completion(.decodedErr)
//                    return
//                }
//                completion(.success(data))
//            }
            
            if dataModel != VoidResult.self{
                let networkResult = self.judgeStatus(by: statusCode, data, dataModel.self)
                completion(networkResult)
            } else {
                let networkResult = self.judgeSimpleResponseStatus(by: statusCode, data)
                completion(networkResult)
            }
            
        case .failure(let err):
            print("[BaseAPI - disposeNetwork]/ndisposeNeretry에도 실패한것 같습니다.")
            print(err)
            completion(.authorizationFail("인증오류입니다람쥐"))
        }
    }

}

