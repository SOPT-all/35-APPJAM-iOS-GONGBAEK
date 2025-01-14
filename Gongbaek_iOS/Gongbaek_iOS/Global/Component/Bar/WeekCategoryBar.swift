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
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.gray01)
                
                RoundedRectangle(cornerRadius: 2)
                    .fill(.white)
                    .frame(width: buttonWidth(in: geometry) - 6, height: 34)
                    .offset(x: sliderOffset(in: geometry))
                    .animation(.easeInOut(duration: 0.2), value: selectedDay)
                
                HStack(spacing: 0) {
                    ForEach(Day.allCases, id: \.self) { day in
                        Button(action: {
                            withAnimation {
                                selectedDay = day
                            }
                        }) {
                            Text(day.rawValue)
                                .font(.pretendard(.caption1_sb_13))
                                .frame(maxWidth: .infinity)
                                .frame(height: 36)
                                .foregroundColor(selectedDay == day ? .mainOrange : .gray06)
                        }
                    }
                }
            }
        }
        .frame(height: 38)
        .padding(.horizontal, 3)
    }

}

extension WeekCategoryBar {
    
    func buttonWidth(in geometry: GeometryProxy) -> CGFloat {
        geometry.size.width / CGFloat(Day.allCases.count)
    }
    
    func sliderOffset(in geometry: GeometryProxy) -> CGFloat {
        let index = Day.allCases.firstIndex(of: selectedDay) ?? 0
        let buttonWidth = geometry.size.width / CGFloat(Day.allCases.count)
        return CGFloat(index) * buttonWidth - geometry.size.width / 2 + buttonWidth / 2
    }
    
}

#Preview {
    WeekCategoryBar()
}
