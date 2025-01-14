//
//  GroupChipState.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/15/25.
//

import SwiftUI

enum GroupChipState {
    case recruiting(RecruitingState)
    case category(CategoryState)
    case weekly(Bool)
    
    enum RecruitingState {
        case recruiting
        case recruited
        case closed
    }
}

extension GroupChipState {
    
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
