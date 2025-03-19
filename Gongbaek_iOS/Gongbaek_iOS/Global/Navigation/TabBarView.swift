//
//  TabBarView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/17/25.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            VStack(spacing: 0) {
                navigationManager.selectedTab.view()
                    .frame(maxHeight: .infinity)
                CustomTabBar(selectedTab: $navigationManager.selectedTab)
            }
            .navigationDestination(for: FillingDestination.self) { type in
                type.view()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .navigationDestination(for: HomeDestination.self) { type in
//                type.view()
//                    .toolbar(.hidden, for: .navigationBar)
            }
            .navigationDestination(for: MyPageDestination.self) { type in
                type.view()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .navigationDestination(for: MeetingDetailDestination.self) { type in
                type.view()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .navigationDestination(for: MeetingRoomDestination.self) { type in
                type.view()
                    .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
}

#Preview {
    TabBarView()
}
