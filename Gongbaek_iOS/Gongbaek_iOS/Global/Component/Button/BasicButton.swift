//
//  BasicButton.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct BasicButton: View {
    let text: String
    var isActivated: Bool
    var onTap: (() -> Void)?
    
    var body: some View {
        Button(action: {
            onTap?()
        }) {
            Text(text)
                .pretendardFont(.title2_sb_18)
                .lineLimit(1)
                .padding(16)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.grayWhite)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(isActivated ? .mainOrange : .gray03)
                )
        }
    }
}

#Preview {
    BasicButton(text: "다음으로", isActivated: true)
    BasicButton(text: "next", isActivated: false)
}
