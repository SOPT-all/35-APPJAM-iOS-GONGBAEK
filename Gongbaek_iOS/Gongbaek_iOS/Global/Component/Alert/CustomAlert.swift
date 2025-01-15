//
//  CustomAlert.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

enum AlertType {
    case subtitle
    case closeButton
    case subtitleCloseButton
    case basic
}

extension AlertType {
    var isSubtitle: Bool {
        switch self {
        case .subtitle, .subtitleCloseButton:
            return true
        default:
            return false
        }
    }
    var isCloseButton: Bool {
        switch self {
        case .closeButton, .subtitleCloseButton:
            return true
        default:
            return false
        }
    }
}

struct AlertData {
    let alertImage: String
    let titleText: String
    var subTitleText: String = ""
    var closeButtonText: String = ""
    let orangeButtonText: String
}

struct CustomedAlert: View {
    let alertType: AlertType
    var alertData: AlertData
    
    var body: some View {
        ZStack {
            BackgroundBlack()
            
            VStack (alignment: .center, spacing: 0) {
                Image("profileImage")
                    .resizable()
                    .background(.gray02)
                    .frame(width: 178, height: 178)
                    .padding(.horizontal, 20)
                
                VStack(spacing: 0) {
                    Text(alertData.titleText)
                        .pretendardFont(.title2_sb_18)
                        .lineLimit(nil)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundStyle(.gray10)
                    Text(alertData.subTitleText)
                        .pretendardFont(.body2_m_14)
                        .lineLimit(nil)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundStyle(.gray07)
                        .padding(.vertical, 4)
                }
                .padding(.horizontal, 20)                .padding(.vertical, 20)
                .padding(.top, alertType.isSubtitle ? 8 : 0)
                
                HStack(alignment: .center, spacing: 10) {
                    alertType.isCloseButton ? CloseButton(closeButtonText: alertData.closeButtonText) : nil
                    
                    Button(action: {
                        print("applyButtonIsTapped")
                    }) {
                        Text(alertData.orangeButtonText)
                            .pretendardFont(.title2_sb_18)
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity)
                            .background(.mainOrange)
                            .foregroundStyle(.grayWhite)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 20)
            .padding(.top, 34)
            .background(RoundedRectangle(cornerRadius: 10).fill(.green))
            .padding(.horizontal, 42)
            .padding(.vertical, 236)
        }
    }
}

struct CloseButton: View {
    var closeButtonText: String
    
    var body: some View {
        Button(action: {
            print("applyButtonIsTapped")
        }) {
            Text(closeButtonText)
                .pretendardFont(.title2_sb_18)
                .padding(.vertical, 16)
                .padding(.horizontal, 21.5)
                .foregroundStyle(.grayWhite)
                .background(.gray08)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
    }
}

struct BackgroundBlack: View {
    var body: some View {
        Rectangle()
            .fill(.grayBlack.opacity(0.7))
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    CustomedAlert(
        alertType: AlertType.subtitleCloseButton,
        alertData: AlertData(
            alertImage: "profile.fill",
            titleText: "모임등록이완료되었다면믿으시겠습니까욥",
            subTitleText: "아니요못믿겠고요 앙앙\n못하겠어요",
            closeButtonText: "닫기",
            orangeButtonText: "다음으로"
        )
    )
}
