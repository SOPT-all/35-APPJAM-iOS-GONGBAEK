//
//  GroupChip.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/14/25.
//

import SwiftUI

struct GroupChip: View {
    var state: GroupChipState
    
    var body: some View {
        Text(state.titleText)
            .font(.pretendard(.caption2_r_12))
            .foregroundColor(state.textColor)
            .padding(.horizontal, 4)
            .padding(.vertical, 1)
            .padding(.horizontal, 4)
            .background(state.backgroundColor)
            .cornerRadius(2)
    }
}

#Preview {
    GroupChip(state: .recruiting(.recruiting))
    GroupChip(state: .recruiting(.recruited))
    GroupChip(state: .recruiting(.closed))
    GroupChip(state: .category(.play))
    GroupChip(state: .category(.networking))
    GroupChip(state: .weekly(true))
    GroupChip(state: .weekly(false))
    
}
