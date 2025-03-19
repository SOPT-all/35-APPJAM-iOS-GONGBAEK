//
//  NavigationManager.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/18/25.
//

import SwiftUI

/// `NavigationPath` 관리하는 전역 내비게이션 매니저
final class NavigationManager: ObservableObject {
    @Published var groupId: Int? = nil
    @Published var groupType: String? = nil
    
    enum RootView {
        case onboarding
        case signup
        case tabBar
    }
    
    @Published var path = NavigationPath()
    @Published var presentedDestination: PresentableDestination? = nil
    @Published var rootView: RootView = .tabBar
    @Published var selectedTab: TabBarState = .home
    
    func push<T: Hashable>(view: T) {
        path.append(view)
    }
    
    func push<T: Hashable>(view: T, groupId: Int, groupType: String) {
        path.append(view)
        self.groupId = groupId
        self.groupType = groupType
    }
    
    func present(_ destination: PresentableDestination) {
        presentedDestination = destination
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func popToRoot() {
        path = NavigationPath()
    }
    
    func dismissPresented() {
        presentedDestination = nil
    }
}
