//
//  SmallButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/11/25.
//

import SwiftUI

struct SmallButton: View {
    var text: String
    var isClicked: Bool
    var onClick: (() -> Void)?
    
    var body: some View {
        Button(action: {
            onClick?()
        }) {
            Text(text)
                .font(isClicked ? .pretendard(.body1_b_16) : .pretendard(.body1_m_16))
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity)
                .background(isClicked ? .subOrange : .gray01)
                .foregroundColor(isClicked ? .mainOrange : .gray07)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    SmallButton(text: "Button", isSelected: true)
}
