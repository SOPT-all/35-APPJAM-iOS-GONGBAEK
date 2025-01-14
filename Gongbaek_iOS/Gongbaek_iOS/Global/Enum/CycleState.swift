//
//  CycleState.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/15/25.
//

import SwiftUI

enum CycleState {
    case all
    case weekly
    case once 
}

extension CycleState {
    
    var titleText: String {
        switch self {
        case .all: return "모든 주기"
        case .weekly: return "매주 봐요"
        case .once: return "한번만 봐요"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .all: return .gray01
        case .weekly, .once: return .gray09
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .all: return .gray10
        case .weekly, .once: return .grayWhite
        }
    }
    
}
