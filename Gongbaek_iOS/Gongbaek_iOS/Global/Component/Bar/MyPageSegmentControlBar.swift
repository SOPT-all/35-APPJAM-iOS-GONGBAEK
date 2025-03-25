//
//  MyFillSegmentControlBar.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

import SwiftUI

enum MyMeetingType: String, CaseIterable {
    case apply = "내가 신청한"
    case register = "내가 모집한"
}

enum MyMeetingCategory: String, CaseIterable {
    case apply = "APPLY"
    case register = "REGISTER"
}

struct MyPageSegmentControlBar: View {
    @ObservedObject var viewModel: MyPageViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(MyMeetingCategory.allCases, id: \.self) { category in
                    let isSelected = viewModel.selectedCategory == category
                    
                    Button {
                        viewModel.selectedCategory = category
                        viewModel.getMeetings()
                    } label: {
                        ZStack(alignment: .bottom) {
                            Text(category == .register ? "내가 모집한" : "내가 신청한") 
                                .pretendardFont(isSelected ? .body1_b_16 : .body1_m_16)
                                .foregroundColor(isSelected ? .gray10 : .gray05)
                                .padding(.vertical, 15)
                            isSelected ?
                            Color(.gray09).frame(height: 2) :
                            Color(.gray02).frame(height: 1)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(.grayWhite)
                }
            }
            selectedView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            viewModel.getMeetings()
        }
        .onChange(of: viewModel.selectedCategory) {
            viewModel.getMeetings()
        }
    }
    
    @ViewBuilder
    private func selectedView() -> some View {
        MyFillingList(viewModel: viewModel)
    }
}
