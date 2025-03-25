//
//  MyFillingView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct MyPageView: View {
    @StateObject var viewModel = MyPageViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                MyProfile()
                Rectangle()
                    .fill(.gray01)
                    .frame(height: 8)
                MyFillSegmentControlBar(viewModel: viewModel)
            }
            
            if viewModel.showAlert {
                FullErrorView(onTapRetryButton: {
                    viewModel.showAlert = false
                    viewModel.getMeetings()
                })
            }
        }
        .customNavigationBar(title: "마이페이지")
        .onAppear {
            viewModel.getMeetings()
        }
    }
}

#Preview {
    MyPageView(viewModel: MyPageViewModel())
}
