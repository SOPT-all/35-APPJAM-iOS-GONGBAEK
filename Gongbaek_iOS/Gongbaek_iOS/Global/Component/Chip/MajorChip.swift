//
//  MajorChip.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

// MARK: TODO - enum 분리 예정

enum MajorChipViewType {
    case ownerProfile
    case suggestedUserProfile
}

struct MajorChip: View {
    let major: String
    let targetObject: MajorChipViewType
    
    var body: some View {
        Text(major)
            .pretendardFont(.caption2_m_12)
            .foregroundStyle(targetObject == .ownerProfile ? .grayWhite : .mainOrange)
            .padding(.horizontal, 6)
            .padding(.vertical, 1)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(targetObject == .ownerProfile ? .gray09 :.subOrange)
            )
    }
}
