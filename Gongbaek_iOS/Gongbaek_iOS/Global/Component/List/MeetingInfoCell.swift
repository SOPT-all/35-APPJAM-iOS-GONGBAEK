//
//  MeetingInfoCell.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

struct MeetingInfoCell: View {
    @State private var selectedButton: String?
    @State var meeting: Meeting
    let state: MeetingInfoState.FillItemState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            MeetingInfoBase(state: .constant(.cell), meeting: $meeting)
            
            if state == .myFill {
                HStack(spacing: 0) {
                    MyFillCellButton(text: "작성글 보기")
                    Rectangle()
                        .fill(.gray03)
                        .frame(width: 1, height: 14)
                    MyFillCellButton(text: "스페이스 입장하기")
                }
                .background(.gray01)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            }
            
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        Rectangle()
            .fill(.gray01)
            .frame(height: 1)
    }
    
}


