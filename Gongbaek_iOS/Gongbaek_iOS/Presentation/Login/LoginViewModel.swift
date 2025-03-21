//
//  LoginViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/20/25.
//

import SwiftUI
import AuthenticationServices

class LoginViewModel: NSObject, ObservableObject {
    // Apple 로그인
    func handleAppleSignIn() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.performRequests()
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
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("🚨Apple 로그인 실패: \(error.localizedDescription)")
    }
}
