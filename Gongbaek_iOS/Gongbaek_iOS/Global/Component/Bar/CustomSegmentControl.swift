//
//  CustomSegmentControl.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct CustomSegmentControl: View {
    let segments: [String]
    @Binding var selected: Int

    var body: some View {
        HStack(spacing: 0) {
            ForEach(segments.indices, id: \.self) { segment in
                Button {
                    selected = segment
                } label: {
                    ZStack(alignment: .bottom) {
                        Text(segments[segment])
                            .pretendardFont(.body1_m_16)
                            .foregroundColor(selected == segment ? .gray10 : .gray05)
                            .padding(.vertical, 15)
                        
                        ZStack(alignment: .bottom) {
                            Color(.gray02)
                                .frame(height: 2)
                            selected == segment ? Color(.gray09).frame(height: 4) : nil
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .background(.grayWhite)
            }
        }
    }
}

#Preview {
    SegmentControlBar(segmentTitles: ["모임정보", "댓글"])
    SegmentControlBar(segmentTitles: ["내가 모집한", "내가 신청한"])
}
