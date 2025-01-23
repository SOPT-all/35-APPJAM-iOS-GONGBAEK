//
//  MeetingInfoBasic.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

struct MeetingInfoBase: View {
    @Binding var state: MeetingInfoState
    @Binding var meeting: Meeting
    
    var body: some View {
        HStack(spacing: 12) {
            Image(.sample)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 102, height: 102)
                .cornerRadius(2)
            
            VStack(alignment: .leading, spacing: 6) {
                
                // 모임 태그
                HStack(spacing: 4) {
                    let states: [MeetingChipState] = [
                        RecruitingState(meeting.status).map { .recruiting($0) },
                        CategoryState(meeting.category).map { .category($0) },
                        GroupState(meeting.groupType).map { .weekly($0) }
                    ].compactMap { $0 }

                    ForEach(states.indices, id: \.self) { index in
                        MeetingChip(state: states[index])
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    // 모임 제목
                    Text(meeting.groupTitle)
                        .font(state.titleFont)
                        .lineLimit(1)
                    
                    // 모임 정보
                    VStack(alignment: .leading, spacing: 2) {
                        TimeBox(
                            state: .gray,
                            text: Date.formattedDateAndStartEndTime(
                                weekDay: WeekDay(meeting.weekDay), // String 처리 후 전달
                                weekDate: meeting.weekDate,
                                startTime: meeting.startTime,
                                endTime: meeting.endTime
                            ),
                            font: state.infoFont
                        )
                        
                        LocationBox(
                            state: .gray,
                            text: meeting.location,
                            font: state.infoFont
                        )
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
}

