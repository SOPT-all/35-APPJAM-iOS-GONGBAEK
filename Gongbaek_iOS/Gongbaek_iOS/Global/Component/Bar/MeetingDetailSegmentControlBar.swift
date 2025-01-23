//
//  CustomSegmentControlBar.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

// MARK: - TODO: enum 분리하기
import SwiftUI

enum MeetingDetailType: String, CaseIterable {
    case meetingInfo = "모임정보"
    case comment = "댓글"
}

struct MeetingDetailSegmentControlBar: View {
    @Binding var introduction: String
    @Binding var ownerInfo: OwnerInfoModel
    @Binding var commentData: CommentModel
    @Binding var currentPeopleCount: Int
    @Binding var maxPeopleCount: Int
    @Binding var meetingStatus: String
    @State private var selectedIndex = 0
    @Binding var isHost: Bool
    @Binding var isApply: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(MeetingDetailType.allCases.indices, id: \.self) { index in
                    let type = MeetingDetailType.allCases[index]
                    let isSelected = selectedIndex == index

                    Button {
                        selectedIndex = index
                    } label: {
                        ZStack(alignment: .bottom) {
                            Text(type.rawValue)
                                .pretendardFont(.body1_m_16)
                                .foregroundColor(isSelected ? .gray10 : .gray05)
                                .padding(.vertical, 15)

                            selectedIndex == index ?
                            Color(.gray09).frame(height: 2) :
                            Color(.gray02).frame(height: 1)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(.grayWhite)
                }
            }
            selectedView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    @ViewBuilder
    private func selectedView() -> some View {
        let type = MeetingDetailType.allCases[selectedIndex]
        switch type {
        case .meetingInfo:
            MeetingInfoView(
                ownerInfo: $ownerInfo,
                introduction: $introduction,
                currentPeopleCount: $currentPeopleCount,
                maxPeopleCount: $maxPeopleCount,
                meetingStatus: $meetingStatus,
                isHost: $isHost,
                isApply: $isApply
            )
        case .comment:
            CommentView(commentData: commentData)
        }
    }
}
