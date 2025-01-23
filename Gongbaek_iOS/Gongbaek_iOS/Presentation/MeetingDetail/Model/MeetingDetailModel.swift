//
//  MeetingDetailModel.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

struct MeetingDetailModel {
    let groupId: Int
    let groupType: String
    let groupTitle: String
    let location: String
    var status: String
    var isHost: Bool
    var isApply: Bool
    var currentPeopleCount: Int
    var maxPeopleCount: Int
    var introduction: String
    let category: String
    let coverImg: Int
    var weekDay: String?
    var weekDate: String?
    var startTime: Double
    var endTime: Double
}
//
//let dummymeetingDetailData: MeetingDetailModel = MeetingDetailModel(
//    groupId: 1,
//    groupType: "WEEKLY",
//    groupTitle: "공강팅",
//    location: "학교 정문",
//    status: "RECRUITING",
//    isHost: true,
//    isApply: true,
//    currentPeopleCount: 4,
//    maxPeopleCount: 6,
//    introduction: "복학하고 친구가 없어요 ㅠㅠ 밥 먹을 사람?",
//    category: "STUDY",
//    coverImg: 1,
//    weekDay: "MON",
//    weekDate: nil,
//    startTime: 10.5,
//    endTime: 12
//)
//
//let dummymeetingDateDetailData: MeetingDetailModel = MeetingDetailModel(
//    groupId: 1,
//    groupType: "ONCE",
//    groupTitle: "공강팅",
//    location: "학교 정문",
//    status: "RECRUITING",
//    isHost: true,
//    isApply: true,
//    currentPeopleCount: 4,
//    maxPeopleCount: 6,
//    introduction: "복학하고 친구가 없어요 ㅠㅠ 밥 먹을 사람?",
//    category: "STUDY",
//    coverImg: 1,
//    weekDay: nil,
//    weekDate: "2025-08-01",
//    startTime: 10.5,
//    endTime: 12
//)
