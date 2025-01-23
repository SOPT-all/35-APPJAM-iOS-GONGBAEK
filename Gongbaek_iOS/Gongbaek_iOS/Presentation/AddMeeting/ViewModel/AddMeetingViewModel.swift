//
//  AddMeetingViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

class AddMeetingViewModel: ObservableObject {
    
    let totalSteps: Int = 8
    
    @Published var currentIndex: Int = 0
    
    @Published var isNextEnabled: Bool = false
    
    @Published var selectedCycle: CycleState? = nil {
        didSet { updateNextButtonState() }
    }
    
    @Published var selectedWeekDate: Date? = nil {
        didSet {
            updateSelectedWeekDay()
            updateNextButtonState()
        }
    }
    
    @Published var selectedWeekDay: WeekDay? = nil {
        didSet { updateNextButtonState() }
    }
    
    @Published var selectedCategory: CategoryState? = nil {
        didSet { updateNextButtonState() }
    }
    
    @Published var selectedCoverIndex: Int? = nil {
        didSet { updateNextButtonState() }
    }
    
    @Published var timeTable: [TimeTableModel] = []
    @Published var selectedCells: Set<TimeTableCellId> = [] {
        didSet { updateNextButtonState() }
    }
    
    @Published var selectedTimeRange: (start: Double, end: Double) = (0, 0) {
        didSet {
            updateNextButtonState()
        }
    }
    
    @Published var location: String = "" {
        didSet { updateNextButtonState() }
    }
    
    @Published var maxPeopleCount: Int = 2
    
    @Published var title: String = "" {
        didSet { updateNextButtonState() }
    }
    
    @Published var introduction: String = "" {
        didSet { updateNextButtonState() }
    }
    
    @Published var showAlert: Bool = false
    
    @Published var isSuccessGetData: Bool = true
    
    init() {
        getTimeTable()
    }
    
    var selectedFormattedDate: String? {
        guard let date = selectedWeekDate else { return nil }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        
        return formatter.string(from: date)
    }
    
    func goToNextPage() {
        if isNextEnabled && currentIndex < totalSteps - 1 {
            resetValuesForNextPage()
            currentIndex += 1
            DispatchQueue.main.async { self.updateNextButtonState() }
        }
    }
    
    
    func updateNextButtonState() {
        DispatchQueue.main.async {
            switch self.currentIndex {
            case 0:
                self.isNextEnabled = self.selectedCycle != nil
            case 1:
                self.isNextEnabled = self.selectedCycle == .once
                ? self.selectedWeekDate != nil
                : self.selectedWeekDay != nil
            case 2:
                self.isNextEnabled = self.selectedTimeRange.start > 0 && self.selectedTimeRange.end > self.selectedTimeRange.start
            case 3:
                self.isNextEnabled = self.selectedCategory != nil
            case 4:
                self.isNextEnabled = self.selectedCoverIndex != nil
            case 5:
                self.isNextEnabled = self.location.count >= 2
            case 6:
                self.isNextEnabled = self.title.count >= 2 && self.introduction.count >= 20
            case 7:
                self.isNextEnabled = true
            default:
                self.isNextEnabled = false
            }
        }
        DispatchQueue.main.async { self.updateNextButtonState() }
    }
    
    func resetValuesForNextPage() {
        switch self.currentIndex {
        case 0:
            self.selectedWeekDate = nil
            self.selectedWeekDay = nil
            
        case 1:
            self.selectedTimeRange = (0, 0)
            self.selectedCells = Set([])
            
        case 2:
            self.selectedCategory = nil
            
        case 3:
            self.selectedCoverIndex = nil
            
        case 4:
            self.location = ""
            
        case 5:
            self.title = ""
            self.introduction = ""
            
        default:
            break
        }
        DispatchQueue.main.async { self.updateNextButtonState() }
    }
    
    func updateSelectedWeekDay() {
        guard let date = selectedWeekDate else {
            selectedWeekDay = nil
            return
        }
        
        let calendar = Calendar(identifier: .gregorian)
        let timeZone = TimeZone(identifier: "Asia/Seoul") ?? .current
        let components = calendar.dateComponents(in: timeZone, from: date)
        
        if let weekDayIndex = components.weekday {
            selectedWeekDay = WeekDay.fromWeekdayIndex(weekDayIndex)
        }
        
        print("✅ 선택된 날짜: \(selectedFormattedDate ?? "N/A")")
        print("✅ 선택된 요일: \(selectedWeekDay?.rawValue ?? "N/A")")
    }
    
    func getSelectedWeekDayEnum() -> WeekDay? {
        guard let selectedDay = selectedWeekDay else { return nil }
        return WeekDay(rawValue: selectedDay.rawValue) ?? WeekDay.fromRawValue(selectedDay.rawValue)
    }
    
    func increasePeopleCount() {
        if maxPeopleCount < 10 {
            maxPeopleCount += 1
        }
    }
    
    func decreasePeopleCount() {
        if maxPeopleCount > 2 {
            maxPeopleCount -= 1
        }
    }
    
    func getSelectedCoverImage() -> String {
        guard let category = selectedCategory,
              let selectedIndex = selectedCoverIndex,
              selectedIndex >= 0,
              selectedIndex <= category.coverImage.count else {
            return "img_cover_default"
        }
        
        return category.coverImage[selectedIndex]
    }
    
    func getFormattedDateTime() -> String {
        guard let selectedCycle = selectedCycle else { return "날짜와 시간을 선택해주세요." }
        
        let startHour = Int(selectedTimeRange.start)
        let endHour = Int(selectedTimeRange.end)
        
        if selectedCycle == .once {
            guard let selectedDate = selectedWeekDate else { return "날짜 선택 필요" }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "M월 d일 EEEE"
            dateFormatter.locale = Locale(identifier: "ko_KR")
            
            let formattedDate = dateFormatter.string(from: selectedDate)
            return "\(formattedDate) \(startHour)시 - \(endHour)시"
            
        } else if selectedCycle == .weekly {
            guard let selectedWeekDay = selectedWeekDay else { return "요일 선택 필요" }
            return "매주 \(selectedWeekDay.rawValue) \(startHour)시 - \(endHour)시"
        }
        
        return "날짜와 시간을 선택해주세요."
    }
    
    func getTimeTable() {
        Providers.fillingProvider.request(target: .getTimeTable, instance: BaseResponse<GetTimeTableResponseDTO>.self) { response in
            guard response.success, let timeTableResponse = response.data else {
                print("❌ 시간표 불러오기 실패: \(response.message ?? "알 수 없는 오류")")
                return
            }
            
            DispatchQueue.main.async {
                self.timeTable = timeTableResponse.timeTable
            }
        }
    }
    
    func postMeeting() {        
        guard let selectedCoverIndex = selectedCoverIndex else {
            return
        }
        
        let weekDate: String = selectedFormattedDate ?? ""

        print("🛠️ 최종 weekDate 값: \(weekDate)")

        let requestData = AddMeetingModel(
            groupType: selectedCycle == .once ? "ONCE" : "WEEKLY",
            weekDate: selectedFormattedDate ?? "" ,
            weekDay: selectedWeekDay?.englishName ?? "MON",
            startTime: selectedTimeRange.start,
            endTime: selectedTimeRange.end,
            category: selectedCategory?.serverName ?? "",
            coverImg: selectedCoverIndex + 1,
            location: location,
            maxPeopleCount: maxPeopleCount,
            groupTitle: title,
            introduction: introduction
        )
        
        Providers.fillingProvider.request(target: .postMeeting(data: requestData), instance: BaseResponse<EmptyResponseDTO>.self) { response in
            print(requestData)
            DispatchQueue.main.async {
                if response.success {
                    self.isSuccessGetData = true
                    print("✅ 모임 등록 성공!")
                } else {
                    self.isSuccessGetData = false
                    print("❌ 모임 등록 실패: \(response.message ?? "알 수 없는 오류")")
                }
            }
        }
    }
}


