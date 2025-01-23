//
//  AddMeetingTimeTable.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/15/25.
//

import SwiftUI

struct AddMeetingTimeTable: View {
    @ObservedObject var viewModel: AddMeetingViewModel
    
    private let hours = Array(stride(from: 9, through: 17.5, by: 0.5))
    private let columns = [GridItem(.fixed(24), spacing: 1)]
    + Array(repeating: GridItem(.flexible(), spacing: 1), count: 5)
    
    @State var timeTable: [TimeTableModel]
    @State var selectedDay: WeekDay
    @Binding var selectedTimeRange: (start: Double, end: Double)
    
    @State private var freeTimeIdToCellsMap: [Int: [TimeTableCellId]] = [:]
    @Binding var selectedCells: Set<TimeTableCellId>
    @State private var currentFreeTimeId: Int? = nil
    
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 1) {
            dayHeader()
            
            ForEach(hours.indices, id: \.self) { hourIndex in
                hourCell(hourIndex)
                timeTableCells(hourIndex)
            }
        }
        .background(.gray02)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray02, lineWidth: 1)
        )
        .onAppear {
            initFreeTimeIdToCellsMap()
        }
    }
    
    // MARK: - Components
    
    private func dayHeader() -> some View {
        GridRow {
            /// 빈칸
            Rectangle()
                .fill(.grayWhite)
                .frame(minWidth: 24, minHeight: 24)
            
            /// 요일
            ForEach(WeekDay.allCases.indices, id: \.self) { dayIndex in
                /// 선택 요일인지 여부
                let isSelectedDay = selectedDay == WeekDay.allCases[dayIndex]
                
                Text(WeekDay.allCases[dayIndex].rawValue)
                    .pretendardFont(isSelectedDay ? .caption2_b_12 : .caption2_r_12)
                    .frame(minWidth: 62, maxWidth: .infinity, minHeight: 24)
                    .foregroundStyle(isSelectedDay ? .grayWhite : .gray06)
                    .background(isSelectedDay ? .gray09 : .grayWhite)
            }
        }
    }
    
    private func hourCell(_ hourIndex: Int) -> some View {
        /// 시간을 1로 나눴을 때 나머지 존재 여부 -> 30분 단위 시간 구분 위함
        let isOnTheHour = hours[hourIndex].truncatingRemainder(dividingBy: 1) == 0
        
        return Text(isOnTheHour ? "\(Int(hours[hourIndex]))" : "")
            .pretendardFont(.caption2_r_12)
            .frame(width: 24, height: 28, alignment: .topTrailing)
            .foregroundStyle(.gray06)
            .background(.grayWhite)
    }
    
    private func timeTableCells(_ hourIndex: Int) -> some View {
        ForEach(WeekDay.allCases.indices, id: \.self) { dayIndex in
            /// 모든 시간표셀들을 구분하기 위한 식별자 id 부여
            let cellId = TimeTableCellId(hourIndex: hours[hourIndex], dayIndex: dayIndex)
            let cellState = cellState(cellId)
            let bottomPadding = bottomPadding(hourIndex, cellId, cellState)
            
            Rectangle()
                .fill(selectedCells.contains(cellId) ? .mainOrange : cellColor(cellState))
                .frame(maxWidth: .infinity, minHeight: 24)
                .padding(.bottom, bottomPadding)
                .onTapGesture {
                    guard cellState == .active else { return }
                    handleOnCellTapped(cellId)
                }
                .id(cellId)
        }
    }
    
    // MARK: - Helper Methods
    
    private func bottomPadding(
        _ hourIndex: Int,
        _ cellId: TimeTableCellId,
        _ cellState: TimeTableCellState
    ) -> CGFloat {
        /// 시간표셀 하단 padding은 연속적으로 이어질 때만 -1로 구분선 제거
        /// 다만 17.5시에 해당하는 셀들은 최하단 셀이므로 0
        if hours[hourIndex] != 17.5 {
            if selectedCells.contains(cellId)
                || cellState == .inactive {
                return -1
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
    
    /// 공강시간 id에 해당하는 셀들 딕셔너리 초기화
    private func initFreeTimeIdToCellsMap() {
        for freeTime in timeTable {
            guard let dayIndex = WeekDay.allCases.firstIndex(where: { $0.rawValue == freeTime.weekDay }) else {
                return
            }
            
            /// 공강시간 시작-종료 시간에 해당하는 모든 시간들을 30분 단위로 쪼갬
            /// -> 각 시간에 해당되는 cell id값  만들고 cells 배열에 저장
            let cells = Array(stride(
                from: freeTime.startTime,
                to: freeTime.endTime,
                by: 0.5
            )).map {
                TimeTableCellId(hourIndex: $0, dayIndex: dayIndex)
            }
            /// 딕셔너리 key는 공강시간 id, value는 해당 공강시간에 속하는 cells
            freeTimeIdToCellsMap[freeTime.id] = cells
        }
    }
    
    /// 특정 셀의 시간이 수업시간(비활성), 공강시간(선택 요일X-비활성), 공강시간(선택 요일-활성)
    /// 세가지 중 어디에 속하는지 확인
    private func cellState(_ cellId: TimeTableCellId) -> TimeTableCellState {
        let isClassTime = freeTimeIdToCellsMap.values.contains { $0.contains(cellId) }
        let isSelectedDay = WeekDay.allCases[cellId.dayIndex] == selectedDay
        
        if isClassTime {
            return .inactive
        } else if isSelectedDay {
            return .active
        } else {
            return .freeTime
        }
    }

    
    private func handleOnCellTapped(_ cellId: TimeTableCellId) {
        let state = cellState(cellId)

        guard state == .active, cellColor(state) == .grayWhite else { return }

        if selectedCells.contains(cellId) {
            selectedCells.remove(cellId) // ✅ 이미 선택된 셀이면 해제
        } else {
            selectedCells.insert(cellId)
            fillConnectedCells(for: cellId)
        }

        updateSelectedTimeRange()
    }
    private func updateSelectedTimeRange() {
        if selectedCells.isEmpty {
            selectedTimeRange = (start: 0, end: 0)
            return
        }
        
        let selectedHours = selectedCells.map { $0.hourIndex }
        let start = selectedHours.min() ?? 0
        let end = selectedHours.max() ?? 0.5
        
        selectedTimeRange = (start: start, end: end + 0.5)
        
        print("🕒 선택된 시간 범위 업데이트: \(selectedTimeRange.start) - \(selectedTimeRange.end)")
    }
    
    private func fillConnectedCells(for cellId: TimeTableCellId) {
        let dayIndex = cellId.dayIndex
        
        // 선택된 시간들 가져오기
        let selectedHours = selectedCells.filter { $0.dayIndex == dayIndex }.map { $0.hourIndex }
        
        guard let minHour = selectedHours.min(), let maxHour = selectedHours.max() else { return }
        
        // 최소~최대 시간 범위 안의 모든 셀을 자동 선택
        for hour in stride(from: minHour, to: maxHour + 0.5, by: 0.5) {
            let newCell = TimeTableCellId(hourIndex: hour, dayIndex: dayIndex)
            
            // 공강 시간(white)인 경우만 추가
            if cellState(newCell) == .active, cellColor(cellState(newCell)) == .grayWhite {
                selectedCells.insert(newCell)
            }
        }
    }
    
    /// 셀에 해당하는 공강 시간 id 찾기
    private func freeTimeId(for cellId: TimeTableCellId) -> Int? {
        for (freeTimeId, cells) in freeTimeIdToCellsMap
        where cells.contains(cellId) {
            return freeTimeId
        }
        return nil
    }
    
    private func cellColor(_ cellState: TimeTableCellState) -> Color {
        switch cellState {
        case .inactive:
            return .gray02
        case .freeTime:
            return .gray01
        case .active:
            return .grayWhite
        }
    }
}


