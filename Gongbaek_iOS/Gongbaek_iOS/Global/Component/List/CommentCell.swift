//
//  CommentCell.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct Comment {
    var id = UUID()
    var isOwner: Bool
    var isWriter: Bool
    var nickmane: String
    var content: String
    var date: String
}

struct CommentsCell: View {
    let comment: Comment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 6) {
                Text(comment.nickmane)
                    .pretendardFont(.body1_sb_16)
                
                comment.isOwner ? OwnerChip() : nil
                
                Spacer()
                
                comment.isWriter ? DeleteButton() : nil
                
            }
            .foregroundColor(.grayBlack)
            .padding(.bottom, 8)
            
            Text(comment.content)
                .pretendardFont(.body2_r_14)
                .foregroundColor(.gray08)
            
                .padding(.bottom, 4)
            
            Text(comment.date)
                .pretendardFont(.caption2_r_12)
                .foregroundColor(.gray05)
        }
        .padding(.vertical, 14)
    }
}

struct DeleteButton: View {
    var body: some View {
        Button (action: {
            print("DeleteButtonTapped")
        }) {
            Image("ic__comment_x_20")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.gray05)
        }
    }
}

#Preview {
    CommentsCell(comment: Comment(isOwner: true, isWriter: true, nickmane: "희은이", content: "난 로이임탄이랑 하기 시러시러 !", date: "12/27/12:05"))
}
