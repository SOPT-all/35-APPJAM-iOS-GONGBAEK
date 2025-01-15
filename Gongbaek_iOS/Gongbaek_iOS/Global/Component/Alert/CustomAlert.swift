//
//  CustomAlert.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

// MARK: - TODO: enum 분리

enum AlertType {
    case basic
    case subtitle
    case closeButton
    case subtitleCloseButton
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

// MARK: - TODO: Model 분리

struct AlertData {
    let alertImage: String
    let titleText: String
    var subtitleText: String = ""
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
                Image(alertData.alertImage) // MARK: - TODO: 이미지 수정
                    .resizable()
                    .background(.gray02) // MARK: - TODO: 이미지 수정 시 삭제
                    .frame(width: 178, height: 178)
                    .padding(.horizontal, 20)
                
                VStack(spacing: 0) {
                    TitleTextBox(text: alertData.titleText)
                    
                    alertType.isSubtitle ? SubtitleTextBox(text: alertData.subtitleText) : nil
                }
                .padding(20)
                .padding(.top, alertType.isSubtitle ? 8 : 0) // subtitle 유무에 따라, VStack에 Padding 추가 삽입
                
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
                            .clipShape(
                                RoundedRectangle(cornerRadius: 6)
                            )
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.top, 34)
            .padding(.bottom, 20)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.green)
            )
            .padding(.horizontal, 42)
            .padding(.vertical, 236)
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

struct TitleTextBox: View {
    let text: String
    
    var body: some View {
        Text(text)
            .pretendardFont(.title2_sb_18)
            .lineLimit(nil)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
            .foregroundStyle(.gray10)
    }
}

struct SubtitleTextBox: View {
    let text: String
    
    var body: some View {
        Text(text)
            .pretendardFont(.body2_m_14)
            .lineLimit(nil)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
            .foregroundStyle(.gray07)
            .padding(.vertical, 4)
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
                .clipShape(
                    RoundedRectangle(cornerRadius: 6)
                )
        }
    }
}

#Preview {
    CustomedAlert(
        alertType: AlertType.subtitleCloseButton,
        alertData: AlertData(
            alertImage: "sample",
            titleText: "모임등록이완료되었다면믿으시겠습니까욥",
            subtitleText: "아니요 모르겠고 내 뷰나 책입져 이자식아!!! 나 집에 갈래!!! 으악으악\n으악아악악!!!!",
            closeButtonText: "닫기",
            orangeButtonText: "다음으로"
        )
    )
}
