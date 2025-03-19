//
//  MyFillingViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/21/25.
//

import SwiftUI

struct myFillStatus {
    let category: String
    let status: Bool
}

class MyFillingViewModel: ObservableObject {
    @Published var activeMeetings: [Meeting] = []
    @Published var endedMeetings: [Meeting] = []
    @Published var selectedCategory: MyFillingCategory = .register
    
    @Published var isActiveEmpty: Bool = false
    @Published var isEndedEmpty: Bool = false
    
    @Published var showAlert: Bool = false
    
    func getMeetings() {
        let dispatchGroup = DispatchGroup()
        var activeMeetings: [Meeting] = []
        var endedMeetings: [Meeting] = []
        
        dispatchGroup.enter()
        Providers.fillingProvider.request(
            target: .getMyFilling(category: selectedCategory.rawValue, status: true),
            instance: BaseResponse<GetMyFillingResponseDTO>.self
        ) { response in
            if response.success, let groupsData = response.data {
                self.showAlert = false
                activeMeetings = groupsData.groups
            } else {
                self.showAlert = true
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        Providers.fillingProvider.request(
            target: .getMyFilling(category: selectedCategory.rawValue, status: false),
            instance: BaseResponse<GetMyFillingResponseDTO>.self
        ) { response in
            if response.success, let groupsData = response.data {
                self.showAlert = false
                endedMeetings = groupsData.groups
            } else {
                self.showAlert = true
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.activeMeetings = activeMeetings
            self.endedMeetings = endedMeetings
            
            self.isActiveEmpty = activeMeetings.isEmpty
            self.isEndedEmpty = endedMeetings.isEmpty
        }
    }
}
