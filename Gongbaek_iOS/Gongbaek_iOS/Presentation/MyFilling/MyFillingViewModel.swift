//
//  MyFillingViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/21/25.
//

import SwiftUI

class MyFillingViewModel: ObservableObject {
    @Published var activeMeetings: [Meeting] = []
    @Published var endedMeetings: [Meeting] = []
    
    @Published var isActiveEmpty: Bool = false
    @Published var isEndedEmpty: Bool = false
    
    init() {
        fetchMeetings(category: .register)
    }
    
    
    //    func loadMeetings() {
    //        let allMeetings = dummyMeetings
    //
    //        self.activeMeetings = allMeetings.filter { $0.status == "RECRUITING" || $0.status == "RECRUITED" }
    //        self.endedMeetings = allMeetings.filter { $0.status == "CLOSED" }
    //
    //        isActiveEmpty = activeMeetings.isEmpty
    //        isEndedEmpty = endedMeetings.isEmpty
    //    }
    
    func fetchMeetings(category: MyFillingType) {
        let dispatchGroup = DispatchGroup()
        var activeMeetings: [Meeting] = []
        var endedMeetings: [Meeting] = []
        
       
        // TargetType의 getMeetings의 category: MyfillType / status: Bool
        
        
        // ✅ 진행 중인 모임 요청 ->  status: true
       
        // ✅ 종료된 모임 요청 ->  status: false
    
        
        //  모든 API 요청이 끝난 후 데이터 업데이트
        //self.activeMeetings = activeMeetings
        //self.endedMeetings = endedMeetings
    }
}


