//
//  MyFillSegmentControlBar.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

import SwiftUI

enum MyFillingType: String, CaseIterable {
    case register = "내가 모집한"
    case apply = "내가 신청한"
}

enum MyFillingCategory: String, CaseIterable {
    case register
    case apply
}

struct MyFillSegmentControlBar: View {
    @State private var selectedIndex = 0
    @ObservedObject var viewModel: MyFillingViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(MyFillingType.allCases.indices, id: \.self) { index in
                    let type = MyFillingType.allCases[index]
                    let isSelected = selectedIndex == index
                    
                    Button {
                        selectedIndex = index
                        viewModel.selectedCategory = index == 0 ? .register : .apply
                        viewModel.fetchMeetings()
                    } label: {
                        ZStack(alignment: .bottom) {
                            Text(type.rawValue)
                                .pretendardFont(.body1_m_16)
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
            viewModel.fetchMeetings() 
        }
    }
    
    @ViewBuilder
    private func selectedView() -> some View {
        MyFillingList(viewModel: viewModel)
    }
}
