//
//  MyRecruit.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct MyFillingList: View {
    @ObservedObject var viewModel = MyFillingViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                MyFillingHeader(icon: .icFire18, title: "현재 활동중인 모임")
                if viewModel.activeMeetings.isEmpty {
                    MyFillingEmptyCell(state: .active)
                } else {
                    ForEach(viewModel.activeMeetings, id: \.groupId) { meeting in
                        MeetingInfoCell(meeting: meeting, state: .myFill)
                    }
                }
                
                MyFillingHeader(icon: .icLock18, title: "종료된 모임")
                if viewModel.endedMeetings.isEmpty {
                    MyFillingEmptyCell(state: .end)
                } else {
                    ForEach(viewModel.endedMeetings, id: \.groupId) { meeting in
                        MeetingInfoCell(meeting: meeting, state: .myFill)
                    }
                }
            }
        }
    }
}

#Preview {
    MyFillingList()
}


