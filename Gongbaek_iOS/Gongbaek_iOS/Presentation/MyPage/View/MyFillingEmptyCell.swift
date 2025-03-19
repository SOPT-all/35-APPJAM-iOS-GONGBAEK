//
//  EmptyCell.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/21/25.
//

import SwiftUI

enum MyFillingEmptyState {
    case active
    case end
}

struct MyFillingEmptyCell: View {
    let state: MyFillingEmptyState
    
    var body: some View {
        VStack(spacing: 4) {
            Image(state == .active ? .imgMyFillEmptyActive : .imgMyFillEmptyEnd)
                .resizable()
                .scaledToFit()
                .frame(width: 74, height: 58)
                .foregroundColor(.gray06)
            
            Text(state == .active ? "현재 활동중인 모임이 없어요." : "종료된 모임이 없어요.")
                .pretendardFont(.caption1_m_13)
                .foregroundColor(.gray08)
        }
        .padding(.vertical, 35)
        .frame(maxWidth: .infinity)
        .background(.gray01)
        .cornerRadius(4)
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
    }
}

