//
//  FillingViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI
import Combine

class FillingViewModel: ObservableObject {
    @Published var isToggleOn: Bool = true
    @Published var meeting: [Meeting] = []
    @Published var selectedCategory: CategoryState = .ALL {
        didSet {
            print("📌 선택된 카테고리 변경됨: \(selectedCategory)")
        }
    }
    
    init() {
        getFillling()
    }
    
    func getFillling() {
        Providers.fillingProvider.request(
            target: .getFilling(category: selectedCategory.serverName),
            instance: BaseResponse<[GetFillingResponseDTO]>.self
        ) { response in
            if response.success, let groupsData = response.data {
                self.meeting = groupsData.map { group in
                    Meeting(
                        groupId: group.groupId,
                        status: "RECRUITING",
                        category: group.category,
                        coverImg: group.coverImg - 1,
                        groupType: group.groupType,
                        groupTitle: group.groupTitle,
                        weekDay: group.weekDay,
                        weekDate: group.weekDate,
                        startTime: group.startTime,
                        endTime: group.endTime,
                        location: group.location
                    )
                }
                print("📌 모임 데이터 로드 성공! \(self.meeting.count)개의 모임")
            } else {
                print("❌ 모임 데이터를 불러오는 데 실패했습니다")
            }
        }
    }
}
