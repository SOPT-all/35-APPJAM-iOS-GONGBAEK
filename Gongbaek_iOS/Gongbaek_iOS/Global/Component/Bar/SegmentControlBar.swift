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

#Preview {
    SegmentControlBar(segmentTitles: ["모임정보", "댓글"])
    SegmentControlBar(segmentTitles: ["내가 모집한", "내가 신청한"])
}
