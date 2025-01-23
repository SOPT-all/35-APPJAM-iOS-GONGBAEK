//
//  FillingList.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/17/25.
//

import SwiftUI

struct FillingList: View {
    @ObservedObject var viewModel = FillingViewModel()
    
    let meetings: [Meeting]
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 0) {
                HStack(spacing: 6) {
                    CycleButton(state: .all)
                        .disabled(true)
                    
                    Spacer()
                    
                    Text(viewModel.isToggleOn ? "겹치는 공백" : "모든 공백")
                        .font(.pretendard(.caption2_r_12))
                        .foregroundColor(.gray06)
                    ToggleButton(isOn: $viewModel.isToggleOn, isDisabled: true)
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
                
                if meetings.isEmpty {
                    FillingEmptyView()
                        .padding(.top, 39)
                } else {
                    VStack(alignment:.leading, spacing: 0) {
                        ForEach(meetings, id: \..groupTitle) { meeting in
                            MeetingInfoCell(meeting: meeting, state: .fill)
                        }
                    }
                }
            }
        }
    }
}
