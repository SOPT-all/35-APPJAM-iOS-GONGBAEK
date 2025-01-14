//
//  SmallButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/11/25.
//

import SwiftUI

struct SmallButton: View {
    var text: String
    var isTapped: Bool
    var onTap: (() -> Void)?
    
    var body: some View {
        Button(action: {
            onTap?()
        }) {
            Text(text)
                .font(isTapped ? .pretendard(.body1_b_16) : .pretendard(.body1_m_16))
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity)
                .background(isTapped ? .subOrange : .gray01)
                .foregroundColor(isTapped ? .mainOrange : .gray07)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    SmallButton(text: "Button", isTapped: true)
}
