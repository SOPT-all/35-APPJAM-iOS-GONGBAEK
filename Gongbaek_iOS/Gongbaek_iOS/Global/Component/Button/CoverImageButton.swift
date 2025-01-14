//
//  CoverImageButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/12/25.
//

import SwiftUI

struct CoverImageButton: View {
    var image: String
    var isSelected: Bool
    var onTap: (() -> Void)?
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Button(action: {
                    onTap?()
                }) {
                    Image(image)
                        .resizable()
                        .scaledToFill() // 이미지를 프레임에 꽉 채우되 비율 유지
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped() // 초과된 부분 제거
                }
                .clipShape(RoundedRectangle(cornerRadius: 4))
            }
            
            if isSelected {
                Rectangle()
                    .fill(Color.black.opacity(0.3))
                    .cornerRadius(4)
                Image(.icCheckFill24)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.orange)
                    .frame(width: 24, height: 24)
            }
        }
        .contentShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    CoverImageButton(image: "sample", isSelected: true)
        .frame(width: 109, height: 109)
}

