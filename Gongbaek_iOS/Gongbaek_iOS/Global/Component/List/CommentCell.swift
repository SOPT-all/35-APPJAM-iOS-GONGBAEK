//
//  CommentCell.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

//struct Comment {
//    var commentId = UUID()
//    var isGroupHost: Bool
//    var isWriter: Bool
//    var nickname: String
//    var body: String
//    var createdAt: String
//}

struct CommentCell: View {
    let comment: Comment //TODO: Binding 추가
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .center, spacing: 6) {
                    Text(comment.nickname)
                        .pretendardFont(.body1_sb_16)
                    comment.isGroupHost ? OwnerChip() : nil
                    Spacer()
                    comment.isWriter ? DeleteButton() : nil
                }
                .foregroundColor(.grayBlack)
                .padding(.bottom, 8)
                
                Text(comment.body)
                    .pretendardFont(.body2_r_14)
                    .foregroundColor(.gray08)
                    .padding(.bottom, 4)
                
                Text(Date.formattedCommentDateTime(comment.createdAt))
                    .pretendardFont(.caption2_r_12)
                    .foregroundColor(.gray05)
            }
            .padding(.vertical, 14)
            
            divider()
        }
    }
    
    func divider() -> some View {
        Color.gray02.frame(height: 1)
    }
}

struct DeleteButton: View {
    var body: some View {
        Button (action: {
            print("DeleteButtonTapped")
        }) {
            Image(.icCommentX20)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.gray05)
        }
    }
}
