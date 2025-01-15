//
//  SegmentControlBar.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct SegmentControlBar: View {
    @State var segmentTitles: [String]
    @State var selectedIndex = 0
    
    var body: some View {
        VStack {
            CustomSegmentControl(segments: segmentTitles, selected: $selectedIndex)
            Spacer()
        }
        .background(.gray05)
    }
}

struct CustomSegmentControl: View {
    let segments: [String]
    @Binding var selected: Int

    var body: some View {
        HStack(spacing: 0) {
            ForEach(segments.indices, id: \.self) { index in
                Button {
                    selected = index
                } label: {
                    ZStack(alignment: .bottom) {
                        Text(segments[index])
                            .pretendardFont(.body1_m_16)
                            .foregroundColor(selected == index ? .gray10 : .gray05)
                            .padding(.vertical, 15)
                        
                        ZStack(alignment: .bottom) {
                            Color(.gray02)
                                .frame(height: 2)
                            selected == index ? Color(.gray09).frame(height: 4) : nil
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
