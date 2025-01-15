//
//  WeekCategoryBar.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/15/25.
//

import SwiftUI

enum Day: String, CaseIterable {
    case all = "전체"
    case mon = "월요일"
    case tue = "화요일"
    case wed = "수요일"
    case thu = "목요일"
    case fri = "금요일"
}

struct WeekCategoryBar: View {
    @State private var selectedDay: Day = .all
    private let hStackSpacing = 5.0
    private let hStackPadding = 3.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.gray01)
                
                let totalWidth = geometry.size.width - hStackPadding * 2 - hStackSpacing * CGFloat(Day.allCases.count - 1)
                /// 전체 버튼이 요일 버튼보다 내부 패딩이 좌우 2씩 작음
                let extraSpace = 4.0
                /// 전체 버튼에서 4만큼 줄었으므로 다른 버튼에 4를 균등하게 분배해야 함
                let weekDayButtonWidth = (totalWidth + extraSpace) / CGFloat(Day.allCases.count)
                let allButtonWidth = weekDayButtonWidth - extraSpace
                
                HStack(spacing: hStackSpacing) {
                    ForEach(Day.allCases, id: \.self) { day in
                        Button(action: {
                            selectedDay = day
                        }) {
                            Text(day.rawValue)
                                .font(.pretendard(.caption1_sb_13))
                                .foregroundColor(selectedDay == day ? .mainOrange : .gray06)
                        }
                        .frame(width: day == .all ? allButtonWidth : weekDayButtonWidth, height: 34)
                        .background(selectedDay == day ? .white : .clear)
                        .clipShape(RoundedRectangle(cornerRadius: 2))
                        .animation(.easeInOut(duration: 0.2), value: selectedDay)
                    }
                }
                .padding(.horizontal, hStackPadding)
            }
        }
        .frame(height: 38)
        .padding(.horizontal, 16)
    }
}

#Preview {
    WeekCategoryBar()
}
