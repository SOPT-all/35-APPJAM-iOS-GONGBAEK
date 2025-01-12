//
//  RegisterCategoryButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/11/25.
//

import SwiftUI

enum CategoryImageState: Int, CaseIterable {
    case study = 1
    case dining = 2
    case sport = 3
    case networking = 4
    case play = 5
    case others = 6
    
    //TODO: 일러스트 이미지 추가
    var categoryImage: String {
        switch self {
        case .study: return ""
        case .dining: return ""
        case .sport: return ""
        case .networking: return ""
        case .play: return ""
        case .others: return ""
        }
    }
    
    var catogoryName: String {
        switch self {
        case .study: return "스터디"
        case .dining: return "식사"
        case .sport: return "운동/산책"
        case .networking: return "네트워킹"
        case .play: return "놀기"
        case .others: return "기타"
        }
    }
}

struct RegisterCategoryButton: View {
    var category: CategoryImageState
    var isClicked: Bool
    var onClick: (() -> Void)?
    
    var body: some View {
        Button(action: {
            onClick?()
        }) {
            VStack(spacing: 10) {
                Image(category.categoryImage)
                    .resizable()
                    .frame(width: 78, height: 78)
                Text(category.catogoryName)
                    .font(.pretendard(.body1_m_16))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.gray08)
            }
            .padding(.vertical, 15)
        }
        .buttonStyle(PlainButtonStyle())
        .background(isClicked ? .subOrange : .gray01)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}


#Preview {
    RegisterCategoryButton(category: .study, isClicked: true)
}
