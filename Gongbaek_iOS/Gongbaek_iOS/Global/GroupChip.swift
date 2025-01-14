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
}
