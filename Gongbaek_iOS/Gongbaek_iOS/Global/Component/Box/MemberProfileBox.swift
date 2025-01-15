//
//  MemberProfileBlock.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct MemberProfileBox: View {
    var profileImage: Int
    var nickname: String
    var isOwner: Bool
    
    var body: some View {
        VStack(spacing: 6) {
            ZStack(alignment: .bottomLeading) {
                Image("이름 넣기")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .background(.gray04)
                    .foregroundStyle(.mainOrange)
                    .overlay(
                        isOwner ? OwnerChip().padding(6) : nil,
                             alignment: .bottomLeading
                    )}
            
            Text(nickname)
                .pretendardFont(.caption1_m_13)
                .foregroundStyle(.gray10)
        }
        .frame(width: 94, height: 104)
    }
}

#Preview {
    MemberProfileBox(profileImage: 1, nickname: "희은이", isOwner: true)
}
