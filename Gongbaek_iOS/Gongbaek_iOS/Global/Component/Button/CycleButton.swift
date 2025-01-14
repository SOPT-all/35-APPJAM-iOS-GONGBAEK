//
//  CycleButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/11/25.
//

import SwiftUI

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

