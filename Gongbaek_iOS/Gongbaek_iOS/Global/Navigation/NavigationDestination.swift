//
//  NavigationDestination.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/18/25.
//

import SwiftUI

enum SignupDestination: Hashable {
    case signup
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .signup:
            SignupView()
        }
    }
}

enum FillingDestination: Hashable, CaseIterable {
    case addMeeting
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .addMeeting:
            AddMeetingView(viewModel: AddMeetingViewModel())
        }
    }
}

enum MyPageDestination: Hashable {
    case myPage
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .myPage:
            MyPageView(viewModel: MyPageViewModel())
        }
    }
}

enum MeetingDetailDestination: Hashable {
    case meetingDetail(groupId: Int, groupType: String)
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .meetingDetail(let groupId, let groupType):
            MeetingDetailView(viewModel: MeetingDetailViewModel(), groupId: groupId, groupType: groupType)
        }
    }
}

enum MeetingRoomDestination: Hashable {
    case meetingRoom(groupId: Int, groupType: String)
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .meetingRoom(let groupId, let groupType):
            MeetingRoomView(viewModel: MeetingRoomViewModel(), groupId: groupId, groupType: groupType)
        }
    }
}

enum HomeDestination: Hashable {
}

/// Present 방식으로 화면 전환되는 Destination 정의
enum PresentableDestination: Identifiable {
    case schoolMajorSearchView(SignupViewModel, SearchViewState)

    var id: String {
        switch self {
        case let .schoolMajorSearchView(_, state):
            return state.rawValue
        }
    }

    @ViewBuilder
    func view() -> some View {
        switch self {
        case let .schoolMajorSearchView(viewModel, state):
            SchoolMajorSearchView(viewModel: viewModel, state: state)
        }
    }
}
