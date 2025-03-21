//
//  RootViewSwitcher.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/22/25.
//

import SwiftUI

struct RootViewSwitcher: View {
    @EnvironmentObject var navigationManager: NavigationManager

    var body: some View {
        switch navigationManager.rootView {
        case .login:
            LoginView()
        case .onboarding:
            OnboardingView()
        case .signup:
            SignupNavigationView()
        case .tabBar:
            TabBarView()
        }
    }
}

#Preview {
    RootViewSwitcher()
        .environmentObject(NavigationManager())
}
