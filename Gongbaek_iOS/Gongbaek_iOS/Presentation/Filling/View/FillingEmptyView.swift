//
//  FillingEmptyView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/23/25.
//

import SwiftUI

struct FillingEmptyView: View {
    @ObservedObject var viewModel = FillingViewModel()
    
    var body: some View {
        VStack() {
            Text("현재 신청 가능한 모임이 없어요!\n직접 모임을 만들어보세요.")
                .pretendardFont(.caption1_m_13)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray06)
                .padding(.top, 161)
                .frame(maxHeight: .infinity)
        }
     
    }
}



