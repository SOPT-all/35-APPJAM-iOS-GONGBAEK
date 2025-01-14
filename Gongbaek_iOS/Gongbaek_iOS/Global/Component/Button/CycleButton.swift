//
//  CycleButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/11/25.
//

import SwiftUI

enum CycleState {
    case all
    case weekly
    case once
    
    var titleText: String {
        switch self {
        case .all: return "모든 주기"
        case .weekly: return "매주 봐요"
        case .once: return "한번만 봐요"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .all: return .gray01
        case .weekly, .once: return .gray09
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .all: return .gray10
        case .weekly, .once: return .grayWhite
        }
    }
}

struct CycleButton: View {
    var state: CycleState
    var onTap: (() -> Void)?

    var body: some View {
        Button(action: {
            print("주기 버튼 클릭됨")
        }) {
            HStack(spacing: 6) {
                Text(state.titleText)
                    .font(.pretendard(.caption1_m_13))
                    .foregroundColor(state.foregroundColor)
                Image(.icArrowBottom18)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.gray05)
                    .frame(width: 18, height: 18)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(state.backgroundColor)
            .cornerRadius(20)
        }
    }
}

#Preview {
    CycleButton(state: .once)
}

