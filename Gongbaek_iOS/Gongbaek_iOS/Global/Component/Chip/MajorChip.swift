//
//  MajorChip.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

enum UserMajorStatus {
    case ownerProfile
    case matchedUserProfile
}

struct MajorChip: View {
    let major: String
    
    var body: some View {
        Text(major)
            .pretendardFont(.caption2_m_12)
            .foregroundStyle(.grayWhite)
            .padding(.horizontal, 6)
            .padding(.vertical, 1)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(.gray09)
            )
    }
}
