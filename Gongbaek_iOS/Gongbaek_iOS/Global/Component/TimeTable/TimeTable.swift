//
//  TimeTable.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/15/25.
//

import SwiftUI

struct TimeTableModel {
    let weekDay: WeekDay
    let startTime: Double
    let endTime: Double
}

enum WeekDay: String, CaseIterable {
    case MON = "월"
    case TUE = "화"
    case WED = "수"
    case THU = "목"
    case FRI = "금"
}

struct CellIdentifier: Hashable {
    let hourIndex: Double
    let dayIndex: Int
}

enum TimeTableCellState {
    case inactive
    case freeTime
    case active
}

struct TimeTable: View {
    let hours = Array(stride(from: 9, through: 17.5, by: 0.5))
    let columns = [GridItem(.fixed(24), spacing: 1)]
    + Array(repeating: GridItem(.flexible(), spacing: 1), count: 5)
    @State var selectedDay: WeekDay
    @State var selectedCells: Set<CellIdentifier> = []
    @Binding var freeTimeTable: [TimeTableModel]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 1) {
            // 첫번째 행: 요일
            Rectangle()
                .fill(Color.white)
                .frame(minWidth: 24, minHeight: 24)
            
            ForEach(WeekDay.allCases.indices, id: \.self) { dayIndex in
                Text(WeekDay.allCases[dayIndex].rawValue)
                    .frame(minWidth: 60, maxWidth: .infinity, minHeight: 24)
                    .font(.system(size: 12, weight: .regular))
                    .background(Color.white)
            }
            
            // 두번째 행부터: 시간 + 셀
            ForEach(hours.indices, id: \.self) { hourIndex in
                Text(hours[hourIndex].truncatingRemainder(dividingBy: 1) == 0 ? "\(Int(hours[hourIndex]))" : "")
                    .frame(width: 24, height: 28, alignment: .topTrailing)
                    .font(.system(size: 12, weight: .regular))
                    .background(Color.white)
                
                ForEach(WeekDay.allCases.indices, id: \.self) { dayIndex in
                    let cellIdentifier = CellIdentifier(hourIndex: hours[hourIndex], dayIndex: dayIndex)
                    let cellState = cellState(cellIdentifier)
                    
                    Rectangle()
                        .fill(selectedCells.contains(cellIdentifier) ? .mainOrange : timeTableCellColor(cellState))
                        .frame(maxWidth: .infinity, minHeight: 24)
                        .padding(.bottom, (selectedCells.contains(cellIdentifier) || (cellState == .inactive) ? -1 : 0))
                        .onTapGesture {
                            if cellState == .active {
                                if selectedCells.contains(cellIdentifier) {
                                    selectedCells.remove(cellIdentifier)
                                } else {
                                    selectedCells.insert(cellIdentifier)
                                }
                            }
                        }
                        .id(cellIdentifier)
                }
            }
        }
        .background(.gray02)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray02, lineWidth: 1)
        )
    }
    
    /// 특정 시간이 수업시간(비활성), 공강시간(선택 요일X-비활성), 공강시간(선택 요일-활성)
    /// 세가지 중 어디에 속하는지 확인
    private func cellState(_ cellIdentifier: CellIdentifier) -> TimeTableCellState {
        let hour = cellIdentifier.hourIndex
        let day = cellIdentifier.dayIndex

        for timeCell in freeTimeTable {
            if WeekDay.allCases[day] == timeCell.weekDay &&
               hour >= timeCell.startTime &&
               hour < timeCell.endTime {
                return selectedDay == WeekDay.allCases[day] ? .active : .freeTime
            }
        }
        return .inactive
    }
    
    private func timeTableCellColor(_ cellState: TimeTableCellState) -> Color {
        switch cellState {
        case .inactive:
            return .gray02
        case .freeTime:
            return .gray01
        case .active:
            return .white
        }
    }
}

#Preview {
    @Previewable @State var freeTimeTable = [
        TimeTableModel(weekDay: .MON, startTime: 9, endTime: 12),
        TimeTableModel(weekDay: .MON, startTime: 14, endTime: 17.5),
        TimeTableModel(weekDay: .TUE, startTime: 14, endTime: 18),
        TimeTableModel(weekDay: .WED, startTime: 9, endTime: 11),
        TimeTableModel(weekDay: .WED, startTime: 12, endTime: 13),
        TimeTableModel(weekDay: .WED, startTime: 13.5, endTime: 15),
        TimeTableModel(weekDay: .THU, startTime: 10, endTime: 18),
        TimeTableModel(weekDay: .FRI, startTime: 10, endTime: 17)
        ]
    
    TimeTable(selectedDay: .MON, freeTimeTable: $freeTimeTable)
}
