//
//  ApplyBar.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct ApplyBar: View {
    var isActivated: Bool
    var currentPeopleCount: Int
    var maxPeopleCount: Int
    var buttonText: String
    
    var body: some View {
        HStack(spacing: 16) {
            Text("\(currentPeopleCount) / \(maxPeopleCount) 명")
                .pretendardFont(.title2_sb_18)
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                .foregroundStyle(isActivated ? .gray01 : .grayWhite)
                .background(isActivated ? .gray09 : .gray04)
                .clipShape(RoundedRectangle(cornerRadius: 6))
            
            Button(action: {
                print("applyButtonIsTapped")
            }) {
                Text(buttonText)
                    .pretendardFont(.title2_sb_18)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(isActivated ? .mainOrange : .gray03)
                    .foregroundStyle(.grayWhite)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            .cornerRadius(6)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .padding(.horizontal, 16)
        .background(.grayWhite)
    }
}

#Preview {
    ApplyBar(isActivated: true, currentPeopleCount: 3, maxPeopleCount: 4, buttonText: "엘렐레")
}
