//
//  ApplyBar.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct Apply {
    var isActivated: Bool
    var currentPeopleCount: Int
    var maxPeopleCount: Int
    var buttonText: String
}

struct ApplyBar: View {
    var apply: Apply
    
    var body: some View {
        HStack(spacing: 16) {
            Text("\(apply.currentPeopleCount) / \(apply.maxPeopleCount) 명")
                .pretendardFont(.title2_sb_18)
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                .foregroundStyle(apply.isActivated ? .gray01 : .grayWhite)
                .background(apply.isActivated ? .gray09 : .gray04)
                .clipShape(RoundedRectangle(cornerRadius: 6))
            
            Button(action: {
                print("applyButtonIsTapped")
            }) {
                Text(apply.buttonText)
                    .pretendardFont(.title2_sb_18)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(apply.isActivated ? .mainOrange : .gray03)
                    .foregroundStyle(.grayWhite)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            .cornerRadius(6)
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 16)
        .background(.grayWhite)
    }
}

#Preview {
    ApplyBar(apply: Apply(isActivated: true, currentPeopleCount: 3, maxPeopleCount: 4, buttonText: "엘렐레"))
}
