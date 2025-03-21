//
//  LoginViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/20/25.
//

import SwiftUI
import AuthenticationServices

class LoginViewModel: NSObject, ObservableObject {
    // 로그인 상태 확인할 변수
    @Published var isSignedIn = false

    // Apple 로그인
    func handleAppleSignIn() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.performRequests()
    }
    
    // 로그인 서버 통신
    func postAuthorizationCode() {
        let requestBody = LoginRequestDTO(platform: PlatformType.APPLE.rawValue)
        
        Providers.sigininProvider.request(
            target: .postSignin(requestBody: requestBody),
            instance: BaseResponse<LoginResponseDTO>.self
        ) { response in
            let data = response.data
            if response.success {
                self.isSignedIn = true
                
                // 통신 결과
                print("👤 User ID: \(data?.userId ?? -1)")
                print("🔑 Access Token: \(data?.accessToken ?? "없음")")
                print("🔄 Refresh Token: \(data?.refreshToken ?? "없음")")
            } else {
                print("🚨서버 통신 실패: \(response.message ?? "알 수 없음")")
            }
        }
    }

}

// Apple 로그인 결과 처리
extension LoginViewModel: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else { return }

        let identityToken = appleIDCredential.identityToken.flatMap { String(data: $0, encoding: .utf8) }

        print("Apple 로그인 성공!!!")
        print("IdentityToken: \(String(describing: identityToken))")
        
        // Keychain에 로그인 정보 저장
        TokenManager.shared.updateIdentityToken(identityToken: identityToken)
        
        //로그인
        postAuthorizationCode()
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("🚨Apple 로그인 실패: \(error.localizedDescription)")
    }
}
