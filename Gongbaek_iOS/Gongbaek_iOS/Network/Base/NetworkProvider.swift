//
//  NetworkProvider.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/12/25.
//

import Foundation

import Moya

class NetworkProvider<Provider : TargetType> : MoyaProvider<Provider> {
    
    func request<Model : Codable>(
        target : Provider,
        instance : BaseResponse<Model>.Type ,
        completion : @escaping(BaseResponse<Model>) -> ()
    ){
        self.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedResponse = try JSONDecoder().decode(instance, from: response.data)
                    
                    // 토큰 만료 감지 Interceptor
                    TokenInterceptor.shared.interceptResponse(response: decodedResponse) {
                        self.request(target: target, instance: instance, completion: completion)
                    }
                    
                } catch {
                    print("🚨 Decoding Error: \(error.localizedDescription)")
                    let errorResponse = BaseResponse<Model>(
                        success: false,
                        code: 0,
                        message: "디코딩 실패",
                        data: nil
                    )
                    completion(errorResponse)
                }
                
            case .failure(let error):
                if let response = error.response {
                    /// 400-500 에러
                    let decodedResponse = BaseResponse<Model>(
                        success: false,
                        code: response.statusCode,
                        message: "",
                        data: nil
                    )
                    if let responseData = String(data: response.data, encoding: .utf8) {
                        print(responseData)
                    } else {
                        print(error.localizedDescription)
                    }
                    completion(decodedResponse)
                } else {
                    /// 네트워크 오류
                    let decodedResponse = BaseResponse<Model>(
                        success: false,
                        code: -1,
                        message: "",
                        data: nil
                    )
                    completion(decodedResponse)
                    print(error.localizedDescription)
                }
            }
        }
    }
}
