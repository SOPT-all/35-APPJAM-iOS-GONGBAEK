//
//  CycleButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/11/25.
//

import SwiftUI

struct CycleButton: View {
    var isClicked: Bool = false

    var body: some View {
        Button(action: {
            print("주기 버튼 클릭됨")
        }) {
            HStack(spacing: 6) {
                Text(isClicked ? "한번 봐요" : "모든 주기")
                    .font(.pretendard(.caption1_m_13))
                    .foregroundColor(isClicked ? .grayWhite : .gray10)
                Image(.icArrowBottom18)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(isClicked ? .gray04 : .gray06)
                    .frame(width: 18, height: 18)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(isClicked ? .gray09: .gray01)
            .cornerRadius(20)
        }
    }
}

#Preview {
    CycleButton(isClicked: false)
}

