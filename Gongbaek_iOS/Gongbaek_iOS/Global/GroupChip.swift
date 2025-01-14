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
