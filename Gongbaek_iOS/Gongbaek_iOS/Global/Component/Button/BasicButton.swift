//
//  BasicButton.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct BasicButton: View {
    let buttonText: String
    let buttonColor: Color
    
    var body: some View {
        Button(action: {
            print("applyButtonIsTapped")
        }) {
            Text(buttonText)
                .pretendardFont(.title2_sb_18)
                .lineLimit(1)
                .padding(16)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.grayWhite) // textColor 변경될 일 없음
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(buttonColor)
                )
        }
    }
}

#Preview {
    BasicButton(buttonText: "다음으로", buttonColor: .gray10)
    BasicButton(buttonText: "next", buttonColor: .gray09)
    BasicButton(buttonText: "ㅋㅋ민서02020201010202101020아아아아아아ㅏ앙", buttonColor: .mainOrange)
}
