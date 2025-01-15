//
//  CustomCalendar.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/15/25.
//

import SwiftUI

struct CustomCalendar: View {
    @State private var month: Date = Date()
    @State private var clickedCurrentMonthDates: Date?
    
    var today: Date {
        let now = Date()
        let components = Calendar.current.dateComponents([.year, .month, .day], from: now)
        return Calendar.current.date(from: components)!
    }
    
    static let calendarHeaderDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월"
        return formatter
    }()
    
    static let weekdaySymbols: [String] = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.veryShortWeekdaySymbols
    }()
    
    init(
        month: Date = Date(),
        clickedCurrentMonthDates: Date? = nil
    ) {
        _month = State(initialValue: month)
        _clickedCurrentMonthDates = State(initialValue: clickedCurrentMonthDates)
    }
    
    var body: some View {
        VStack {
            headerView
            calendarGridView
        }
    }
    
    private var headerView: some View {
        VStack {
            HStack(alignment: .center, spacing: 10) {
                Button(
                    action: {
                        changeMonth(by: -1)
                    }) {
                        Image(.icArrowLeft32)
                            .foregroundColor(.gray04)
                            .frame(width: 32, height: 32)
                    }
                    .disabled(false)
                
                Text(month, formatter: Self.calendarHeaderDateFormatter)
                    .font(.pretendard(.title2_sb_18))
                
                Button(
                    action: {
                        changeMonth(by: 1)
                    }) {
                        Image(.icArrowRight32)
                            .foregroundColor(.gray04)
                            .frame(width: 32, height: 32)
                    }
                    .disabled(false)
            }
                .padding(.bottom, 24)
            
            HStack {
                ForEach(Self.weekdaySymbols.indices, id: \.self) { index in
                    let symbol = Self.weekdaySymbols[index]
                    Text(symbol)
                        .font(.pretendard(.body1_sb_16))
                        .foregroundColor(.gray06)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, 28)
        }
    }
    
    private var calendarGridView: some View {
        let daysInMonth = numberOfDays(in: month)
        let firstWeekday = firstWeekdayOfMonth(in: month) - 1
        let lastDayOfMonthBefore = numberOfDays(in: previousMonth())
        let numberOfRows = Int(ceil(Double(daysInMonth + firstWeekday) / 7.0))
        let visibleDaysOfNextMonth = numberOfRows * 7 - (daysInMonth + firstWeekday)
        
        return LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 24) {
            ForEach(-firstWeekday ..< daysInMonth + visibleDaysOfNextMonth, id: \.self) { index in
                Group {
                    if index > -1 && index < daysInMonth {
                        let date = getDate(for: index)
                        let day = Calendar.current.component(.day, from: date)
                        let clicked = clickedCurrentMonthDates == date
                        let isToday = date.formattedCalendarDayDate == today.formattedCalendarDayDate
                        let weekday = Calendar.current.component(.weekday, from: date)
                        let isPast = date < today
                        
                        CalendarCell(
                            day: day,
                            clicked: clicked,
                            isToday: isToday,
                            isCurrentMonthDay: true,
                            isDisabled: isWeekend(weekday) || isPast
                        )
                        .onTapGesture {
                            if !isWeekend(weekday) && !isPast {
                                clickedCurrentMonthDates = date
                                print("Clicked date: \(date)") // 클릭된 날짜 출력

                            }
                        }
                    } else if let prevMonthDate = Calendar.current.date(
                        byAdding: .day,
                        value: index + lastDayOfMonthBefore,
                        to: previousMonth()
                    ) {
                        let day = Calendar.current.component(.day, from: prevMonthDate)
                      
                        CalendarCell(
                            day: day,
                            isDisabled: true
                        )
                    }
                }
            }
        }
    }
    
    private func isWeekend(_ weekday: Int) -> Bool {
        return weekday == 1 || weekday == 7
    }
}

private struct CalendarCell: View {
    private var day: Int
    private var clicked: Bool
    private var isToday: Bool
    private var isCurrentMonthDay: Bool
    private var isDisabled: Bool
    
    private var textColor: Color {
        return getTextColor()
    }
    
    private var backgroundColor: Color {
        return getBackgroundColor()
    }
    
    fileprivate init(
        day: Int,
        clicked: Bool = false,
        isToday: Bool = false,
        isCurrentMonthDay: Bool = true,
        isDisabled: Bool = false
    ) {
        self.day = day
        self.clicked = clicked
        self.isToday = isToday
        self.isCurrentMonthDay = isCurrentMonthDay
        self.isDisabled = isDisabled
    }
    
    var body: some View {
        Circle()
            .fill(backgroundColor)
            .overlay(
                Text(String(day))
                    .font(.pretendard(.body1_m_16))
            )
            .foregroundColor(textColor)
            .frame(height: 28)
    }
    
    private func getTextColor() -> Color {
        switch (isDisabled, clicked, isToday, isCurrentMonthDay) {
        case (true, _, _, _): return .gray04
        case (_, true, _, _): return .grayWhite
        case (_, _, true, _): return .mainOrange
        case (_, _, _, true): return .grayBlack
        default: return .gray04
        }
    }
    
    private func getBackgroundColor() -> Color {
        return clicked ? .mainOrange : .white
    }
}

extension CustomCalendar {

    func getDate(for index: Int) -> Date {
        let calendar = Calendar.current
        guard let firstDayOfMonth = calendar.date(
            from: DateComponents(
                year: calendar.component(.year, from: month),
                month: calendar.component(.month, from: month),
                day: 1
            )
        ) else {
            return Date()
        }
        
        var dateComponents = DateComponents()
        dateComponents.day = index
        
        let timeZone = TimeZone.current
        let offset = Double(timeZone.secondsFromGMT(for: firstDayOfMonth))
        dateComponents.second = Int(offset)
        
        let date = calendar.date(byAdding: dateComponents, to: firstDayOfMonth) ?? Date()
        return date
    }
    
    func numberOfDays(in date: Date) -> Int {
        return Date.numberOfDays(in: date)
    }

    func firstWeekdayOfMonth(in date: Date) -> Int {
        return Date.firstWeekdayOfMonth(in: date)
    }

    func previousMonth() -> Date {
        return Date.previousMonth(from: month)
    }

    func adjustedMonth(by value: Int) -> Date {
        return Date.adjustedMonth(from: month, by: value)
    }
    
    func changeMonth(by value: Int) {
        self.month = adjustedMonth(by: value)
    }
}

#Preview {
    CustomCalendar()
        .padding(16)
    Spacer()
}
