//
//  LoginView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/20/25.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @EnvironmentObject var navigationManager: NavigationManager

    var body: some View {
        ZStack(alignment: .top) {
            Color(.gray10).ignoresSafeArea()
            
            VStack {
                Image(.imgLogo)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.top, 248)
                
                MultiColoredText(
                    originalText: "공강을 백으로 채우다",
                    coloredSubstrings: [("공", .mainOrange), ("백", .mainOrange)]
                )
                .foregroundColor(.grayWhite)
                .font(.pretendard(.body2_sb_14))
                .padding(.top, 28)

                Spacer()
                
                //애플 로그인 버튼
                Button(action: {
                    viewModel.navigationManager = navigationManager
                    viewModel.handleAppleSignIn()
                }) {
                    HStack(alignment: .center, spacing: 8) {
                        Image(.imgAppleLogo)
                            .resizable()
                            .frame(width: 13, height: 14)
                        Text("Apple로 로그인")
                            .foregroundColor(.grayBlack)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 21)
                }
                .background(.grayWhite)
                .cornerRadius(6)
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
        }
    }
}

#Preview {
    LoginView()
}
