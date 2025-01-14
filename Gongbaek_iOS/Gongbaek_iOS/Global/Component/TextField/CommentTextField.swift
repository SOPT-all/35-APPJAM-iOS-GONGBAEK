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
    var sendButtonTapped: (() -> Void)?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .foregroundStyle(.gray01)
                .cornerRadius(6)
                .frame(height: textFieldHeight)
            
            HStack(alignment: .bottom, spacing: 0) {
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
                .padding(.trailing, 4)
                .background(
                    GeometryReader { geometry in
                        Color.clear
                            .onChange(of: geometry.size.height) { oldHeight, newHeight in
                                self.textFieldHeight = newHeight
                            }
                    }
                )
                
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
                .padding(.bottom, 14)
                .padding(.trailing, 12)
                .frame(alignment: .bottom)
                .foregroundStyle(.mainOrange)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
    }
}

#Preview {
    CommentTextField()
}
