//
//  MyProfile.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/25/25.
//

import SwiftUI

struct MyProfile: View {
    var body: some View {
        HStack(spacing: 14) {
            Image(.imgProfileDefault0)
                .resizable()
                .frame(width: 64, height: 64)
                .padding(8)
                .border(.gray02, width: 1)
                .cornerRadius(2)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("로이임탄")
                    .pretendardFont(.title1_m_20)
                    .foregroundColor(.grayBlack)
                Text("가톨릭대학교 | 글로벌문화산업MICE 전공")
                    .pretendardFont(.body2_r_14)
                    .foregroundColor(.gray08)
            }
            Spacer()
        }
        .padding(16)
    }
}

#Preview {
    MyProfile()
}
