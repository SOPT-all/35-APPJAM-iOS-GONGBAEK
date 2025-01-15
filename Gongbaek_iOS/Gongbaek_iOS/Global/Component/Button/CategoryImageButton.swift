//
//  RegisterCategoryButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/11/25.
//

import SwiftUI

struct CategoryImageButton: View {
    var category: CategoryState
    var isSelected: Bool
    var onTap: (() -> Void)?
    
    var body: some View {
        Button(action: {
            onTap?()
        }) {
            VStack(spacing: 10) {
                Image(category.categoryImage)
                    .resizable()
                    .frame(width: 78, height: 78)
                Text(category.catogoryName)
                    .font(.pretendard(.body1_m_16))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.gray08)
            }
            .padding(.vertical, 15)
        }
        .buttonStyle(PlainButtonStyle())
        .background(isSelected ? .subOrange : .gray01)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    CategoryImageButton(category: .study, isSelected: true)
}
