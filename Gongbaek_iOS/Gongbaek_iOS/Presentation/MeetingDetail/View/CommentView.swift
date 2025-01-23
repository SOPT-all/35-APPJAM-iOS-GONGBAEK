//
//  CommentView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct CommentView: View {
    var commentData: CommentModel
    
    var body: some View {
        VStack {
            RecruitingState(commentData.groupStatus) == .CLOSED ? CommentDisabledBox() : nil
            
            CommentList(
                viewModel: MeetingRoomViewModel(),
                commentCount: commentData.commentCount,
                comments: commentData.comments,
                isScrolled: true,
                onTapRefreshButton: nil
            )
            
            RecruitingState(commentData.groupStatus) == .CLOSED ? nil : CommentTextField(viewModel: MeetingRoomViewModel())
        }
    }
}
//
//#Preview {
//    MeetingDetailView(
//        meetingDetailData: dummymeetingDetailData,
//        ownerInfoData: dummyOwnerInfoData,
//        commentData: dummyCommentData
//    )
//}
