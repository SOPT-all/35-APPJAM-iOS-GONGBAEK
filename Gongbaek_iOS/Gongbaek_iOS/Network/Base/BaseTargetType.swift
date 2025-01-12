//
//  BaseTargetType.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/12/25.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType {}

extension BaseTargetType {
    typealias Parameters = [String: String]
    var baseURL: URL {
        guard let baseURL = URL(string: Config.baseURL) else {
            print("🚨🚨 BASE_URL ERROR 🚨🚨")
            fatalError()
        }
        return baseURL
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}
