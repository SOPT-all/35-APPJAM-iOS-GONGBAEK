//
//  CategoryButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/11/25.
//

import SwiftUI

struct CategoryButton: View {
    var text: String
    var isSelcted: Bool
    var onTap: (() -> Void)?
    
    var body: some View {
        Button(action: {
            onTap?()
        }) {
            Text(text)
                .font(isSelcted ? .pretendard(.caption1_sb_13) : .pretendard(.caption1_m_13))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(isSelcted ? .gray09 : .grayWhite)
                .foregroundColor(isSelcted ? .gray01 : .gray06)
                .overlay(
                    isSelcted
                        ? nil
                        : RoundedRectangle(cornerRadius: 4)
                        .stroke(.gray02, lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    CategoryButton(text: "카테고리", isSelcted: false)
}
