//
//  GroupChip.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/14/25.
//

import SwiftUI

enum GroupChipState {
    case recruiting(RecruitingState)
    case category(CategoryImageState)
    case weekly(Bool)
    
    enum RecruitingState {
        case recruiting
        case recruited
        case closed
    }
}

extension GroupChipState {
    // 배경색
    var backgroundColor: Color {
        switch self {
        case .recruiting(let recruitingState):
            switch recruitingState {
            case .recruiting:
                return .gray08
            case .recruited:
                return .gray06
            case .closed:
                return .gray02
            }
        case .category, .weekly:
            return .gray01
        }
    }
    
    // 글자색
    var textColor: Color {
        switch self {
        case .recruiting(let recruitingState):
            switch recruitingState {
            case .recruiting, .recruited:
                return .grayWhite
            case .closed:
                return .gray07
            }
        case .category:
            return .mainOrange
        case .weekly(let isWeekly):
            return isWeekly ? .subGreen : .subBlue
        }
    }
    
    var titleText: String {
        switch self {
        case .recruiting(let recruitingState):
            switch recruitingState {
            case .recruiting:
                return "모집중"
            case .recruited:
                return "모집마감"
            case .closed:
                return "마감"
            }
        case .category(let categoryState):
            return categoryState.catogoryName
        case .weekly(let isWeekly):
            return isWeekly ? "매주 보기" : "한번 보기"
        }
    }
}

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
