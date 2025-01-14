//
//  ProfileDetailChip.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

enum ProfileDetailState {
    case grade
    case MBTI
}

struct ProfileDetailChip: View {
    let detailCategory: ProfileDetailState
    
    var body: some View {
        HStack {
            Text(detailCategory == .MBTI ? "MBTI" : "학번/학년")
                .pretendardFont(.caption2_m_12)
                .foregroundStyle(.mainOrange)
                .padding(.horizontal, 6)
                .padding(.vertical, 1)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                    .fill(.grayWhite)
                )
        }
    }
}
