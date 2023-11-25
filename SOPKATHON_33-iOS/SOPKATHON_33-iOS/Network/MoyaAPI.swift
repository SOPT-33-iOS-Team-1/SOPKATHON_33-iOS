//
//  MoyaAPI.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/26.
//

import UIKit
import Moya

final class MoyaAPI: BaseAPI {
    static let shared = MoyaAPI()
    var provider = MoyaProvider<MoyaService>(plugins: [MoyaLoggingPlugin()])
    private override init() {}
}

extension MoyaAPI {
    public func getMainData(completion: @escaping (NetworkResult<Any>) -> Void) {
        provider.request(.getMainData) { (result) in
            self.disposeNetwork(
                result,
                dataModel: MainModel.self,
                completion: completion)
        }
    }
    
    public func getGelationData(completion: @escaping (NetworkResult<Any>) -> Void) {
        provider.request(.getGelationData) { (result) in
            self.disposeNetwork(
                result,
                dataModel: GelationModel.self,
                completion: completion)
        }
    }
    
    public func getProgramData(type: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        provider.request(.getProgramData(type: type)) { (result) in
            self.disposeNetwork(
                result,
                dataModel: [ProgramModel].self,
                completion: completion)
        }
    }
}

