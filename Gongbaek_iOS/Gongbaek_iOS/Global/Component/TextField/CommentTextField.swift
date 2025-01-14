//
//  CommentTextField.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct CommentTextField: View {
    @State private var writeComment: String = ""
    @State private var textFieldHeight: CGFloat = 48
    @State var sendButtonTapped: (() -> Void)?
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 4) {
            TextField(
                "댓글을 입력해주세요.",
                text: $writeComment,
                axis: .vertical
            )
            .pretendardFont(.body1_m_16)
            .background(.gray01)
            .foregroundColor(.gray10)
            .lineLimit(1...3)
            .padding(.vertical, 14)
            .padding(.leading, 12)
            
            Button(action: {
                sendButtonTapped?() // 깡통
                guard !writeComment.isEmpty else { return }
                writeComment = ""
            }) {
                Image("ic_send_24")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
            .padding(.bottom, 12)
            .padding(.trailing, 12)
            .foregroundStyle(.mainOrange)
            .frame(alignment: .bottomTrailing)
        }
        .background(
            RoundedRectangle(cornerRadius: 6)
                .fill(.gray01)
        )
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .background(.grayWhite)
    }
}

#Preview {
    CommentTextField()
}
