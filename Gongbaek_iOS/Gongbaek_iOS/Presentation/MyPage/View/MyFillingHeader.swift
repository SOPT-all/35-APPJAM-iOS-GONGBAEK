//
//  MyFillingHeader.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/21/25.
//

import SwiftUI

struct MyFillingHeader: View {
    let icon: ImageResource
    let title: String
    
    var body: some View {
        HStack(spacing: 4) {
            Image(icon)
                .renderingMode(.original)
                .frame(width: 18, height: 18)
            Text(title)
                .font(.pretendard(.title2_sb_18))
        }
        .padding(.top, 28)
        .padding(.bottom, 6)
        .padding(.horizontal, 16)
    }
}

