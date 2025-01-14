//
//  MajorChip.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

enum UserMajorStatus {
    case ownerProfile
    case suggestedUserProfile
}

struct MajorChip: View {
    let major: String
    let user: UserMajorStatus
    
    var body: some View {
        Text(major)
            .pretendardFont(.caption2_m_12)
            .foregroundStyle(user == .ownerProfile ? .grayWhite : .mainOrange)
            .padding(.horizontal, 6)
            .padding(.vertical, 1)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(user == .ownerProfile ? .gray09 :.subOrange)
            )
    }
}
