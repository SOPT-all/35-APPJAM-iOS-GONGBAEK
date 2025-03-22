//
//  TokenInterceptor.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/21/25.
//

import Foundation

import Moya

class TokenInterceptor {
    static let shared = TokenInterceptor()
    
    // 현재 토큰을 갱신 중인지 여부 판단
    private var isRefreshing = false
    
    // 토큰이 만료된 후 토큰을 갱신할 네트워크 요청을 저장
    // 토큰이 만료됨 -> 네트워크 요청을 즉시 다시 시도하지 않고 저장했다 갱신되면 한꺼번에 실행
    private var requestQueue: [(()->Void)] = []

    
    // 서버 응답을 가로채 토큰 만료 여부 확인
    // retry : 토큰이 갱신된 후 다시 실행해야 하는 요청을 클로저로 전달
    func interceptResponse<Model: Decodable>(
        response: BaseResponse<Model>,
        retry: @escaping () -> Void
    ) {
        // 토큰 만료 감지
        if response.code == 4012 {
            print("🚨 Access Token 만료 감지 토큰 갱신 요청")

            // 토큰 갱신된 후 다시 실행할 수 있도록  현재 진행 중인 요청을 requestQueue에 저장
            requestQueue.append(retry)
            
            // isRefreshing이 true라면 이미 갱신 중 -> 중복 요청 방지
            if !isRefreshing {
                isRefreshing = true
                
                // 토큰 갱신 요청
                TokenManager.shared.reissueToken { success in
                    self.isRefreshing = false
                    
                    if success {
                        // 토큰 갱신 성공 시 기존 요청을 requestQueue에서 꺼내 실행
                        print("토큰 갱신 완료 -> 기존 요청 재시도")
                        self.requestQueue.forEach { $0() }
                        self.requestQueue.removeAll()
                    } else {
                        // 토큰 갱신 실패 시 대기 중인 요청 삭제
                        print("🚨 토큰 갱신 실패")
                        self.requestQueue.removeAll()
                    }
                }
            }
        }
    }
}
