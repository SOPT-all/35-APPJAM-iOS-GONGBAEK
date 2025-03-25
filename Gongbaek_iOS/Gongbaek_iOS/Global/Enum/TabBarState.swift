//
//  TabBarState.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/17/25.
//

import SwiftUI

enum TabBarState: CaseIterable {
    case filling
    case myFilling
    case home
    case timetable
    case myPage
}

extension TabBarState {
    var title: String {
        switch self {
        case .filling: "채우기"
        case .myFilling: "나의 채움"
        case .home: "홈"
        case .timetable: "시간표"
        case .myPage: "마이"
        }
    }
    
    var defaultImage: ImageResource {
        switch self {
        case .filling: .icTabbarFillGray26
        case .myFilling: .icTabbarMyFillGray26
        case .home: .icTabbarHomeGray26
        case .timetable: .icTabbarTimetableGray26
        case .myPage: .icTabbarMyGray26
        }
    }
        
    var selectedImage: ImageResource {
        switch self {
        case .filling: .icTabbarFillBlack26
        case .myFilling: .icTabbarMyFillBlack26
        case .home: .icTabbarHomeBlack26
        case .timetable: .icTabbarTimetableBlack26
        case .myPage: .icTabbarMyBlack26
        }
    }
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .filling: FillingView()
        case .myFilling: Color.gray02
        case .home: HomeView()
        case .timetable: Color.gray04
        case .myPage: MyPageView(viewModel: MyPageViewModel())
        }
    }
}
