//
//  MeetingDetailView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct MeetingDetailView: View {
    @State var meetingDetailData: MeetingDetailModel
    @State var ownerInfoData: OwnerInfoModel
    @State var commentData: CommentModel
    
    var body: some View {
        VStack(spacing: 0) {
            MeetingInfoBase(
                state: .constant(.detail),
                meeting: .constant(Meeting(
                    groupId: 0, status: meetingDetailData.status,
                    category: meetingDetailData.category,
                    coverImg: 5,//TODO: Int로 넘기기 meetingDetailData.coverImg,
                    groupType: meetingDetailData.groupType,
                    groupTitle: meetingDetailData.groupTitle,
                    weekDay: meetingDetailData.weekDay,
                    weekDate: meetingDetailData.weekDate,
                    startTime: meetingDetailData.startTime,
                    endTime: meetingDetailData.endTime,
                    location: meetingDetailData.location
                )))
            .padding(16)
            
            divider()
            
            MeetingDetailSegmentControlBar(
                introduction: $meetingDetailData.introduction,
                ownerInfo: $ownerInfoData,
                commentData: $commentData,
                currentPeopleCount: $meetingDetailData.currentPeopleCount,
                maxPeopleCount: $meetingDetailData.maxPeopleCount,
                meetingStatus: $meetingDetailData.status,
                isHost: $meetingDetailData.isHost,
                isApply: $meetingDetailData.isApply
            )
        }
    }
    
    func divider() -> some View {
        Color.gray02.frame(height: 8)
    }
}

//#Preview {
//    MeetingDetailView(
//        meetingDetailData: dummymeetingDetailData,
//        ownerInfoData: dummyOwnerInfoData,
//        commentData: dummyCommentData
//    )
//}
//
//#Preview {
//    MeetingDetailView(
//        meetingDetailData: dummymeetingDateDetailData,
//        ownerInfoData: dummyOwnerInfoData,
//        commentData: dummyCommentData
//    )
//}
