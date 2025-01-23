//
//  NavigationManager.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/18/25.
//

import SwiftUI

/// `NavigationPath` 관리하는 전역 내비게이션 매니저
final class NavigationManager: ObservableObject {
    
    enum RootView {
        case signup
        case tabBar
    }
    
    @Published var path = NavigationPath()
    @Published var presentedDestination: PresentableDestination? = nil
    @Published var rootView: RootView = .tabBar
    
    func push<T: Hashable>(view: T) {
        path.append(view)
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
