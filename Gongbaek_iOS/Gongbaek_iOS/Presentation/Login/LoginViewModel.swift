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
    
    var navigationManager: NavigationManager?
    
    // Apple 로그인
    func handleAppleSignIn() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.performRequests()
    }
    
    // 로그인 서버 통신
    func postSignin() {
        let requestBody = PostSigninRequestDTO(platform: PlatformType.APPLE.rawValue)
        
        Providers.sigininProvider.request(
            target: .postSignin(requestBody: requestBody),
            instance: BaseResponse<PostSigninResponseDTO>.self
        ) { response in
            guard response.success, let data = response.data else {
                print("🚨 서버 통신 실패: \(response.message ?? "알 수 없음")")
                return
            }
            
            self.isSignedIn = true
            
            print("👤 User ID: \(String(describing: data.userId))")
            print("🔑 Access Token: \(data.accessToken)")
            print("🔄 Refresh Token: \(data.refreshToken)")
            
            // 키체인에 토큰 저장
            TokenManager.shared.updateToken(data.accessToken, data.refreshToken)
            
            self.navigationManager?.rootView = .signup
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
        
        //서버 통신 메서드 호출
        postSignin()
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("🚨Apple 로그인 실패: \(error.localizedDescription)")
    }
}
