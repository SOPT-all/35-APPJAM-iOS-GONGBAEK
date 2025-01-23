//
//  MeetingRoomView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

import SwiftUI

struct MeetingRoomView: View {
    @StateObject var viewModel: MeetingRoomViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 5) {
                            ForEach(viewModel.meetingStates.indices, id: \.self) { index in
                                MeetingChip(state: viewModel.meetingStates[index])
                            }
                        }
                        .padding(.top, 18)
                        .padding(.bottom, 6)
                        
                        Text(viewModel.groupTitle)
                            .pretendardFont(.title1_b_20)
                            .foregroundColor(.grayWhite)
                            .lineLimit(nil)
                            .padding(.bottom, 12)
                        
                        TimeBox(
                            state: .white,
                            text: Date.formattedDateAndStartEndTime(
                                weekDay: WeekDay(viewModel.weekDay),
                                weekDate: viewModel.weekDate,
                                startTime: viewModel.startTime,
                                endTime: viewModel.endTime
                            ),
                            font: .pretendard(.caption2_r_12)
                        )
                        .padding(.bottom, 2)
                        
                        LocationBox(state: .white, text: viewModel.location, font: .pretendard(.caption2_r_12))
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        Image("sample")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 232)
                            .clipped()
                    )
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Image(.icPeople18)
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundStyle(.gray06)
                            
                            Text(viewModel.memberCount)
                                .pretendardFont(.title2_sb_18)
                                .foregroundStyle(.gray10)
                        }
                        .padding(.top, 16)
                        .padding(.bottom, 12)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.grayWhite)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 6) {
                            if let memberData = viewModel.memberData {
                                ForEach(memberData.members.indices, id: \.self) { index in
                                    MemberProfileBox(memberData: memberData.members[index])
                                }
                            }
                        }
                        .padding(.horizontal, 9)
                        .padding(.bottom, 16)
                    }
                    .background(.grayWhite)
                    
                    divider()
                    
                    viewModel.isCommentDisabled ? CommentDisabledBox() : nil
                }
                
                
                CommentList(
                    viewModel: viewModel,
                    commentCount: viewModel.commentData?.commentCount ?? 0,
                    comments: viewModel.commentData?.comments ?? [],
                    isScrolled: false,
                    onTapRefreshButton: nil
                )
                .frame(maxHeight: .infinity)
            }
            
            viewModel.isCommentDisabled ? nil : CommentTextField(viewModel: viewModel)
        }
        .onAppear {
            print("onAppear called")
            //TODO: Navigation 연결 시 수정
            viewModel.getDetails(groupId: 7, groupType: "WEEKLY") { _ in
                print("getDetails finished, meetingDetailData: \(String(describing: viewModel.meetingDetailData))")
            }
            
            viewModel.getMembers(groupId: 7, groupType: "WEEKLY") { _ in
                print("getMembers finished, memberData: \(String(describing: viewModel.memberData))")
            }
            
            viewModel.getComments(groupId: 7, groupType: "WEEKLY") { _ in
                print("getComments finished, memberData: \(String(describing: viewModel.commentData))")
            }
        }
    }
    
    func divider() -> some View {
        Color.gray02.frame(height: 8)
    }
}
