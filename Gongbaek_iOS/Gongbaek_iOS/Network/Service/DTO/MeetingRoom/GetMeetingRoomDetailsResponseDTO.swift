//
//  GetMeetingRoomDetailsResponseDTO.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/23/25.
//

struct GetMeetingRoomDetailsResponseDTO: Codable {
    let groupId: Int
    let groupType: String
    let groupTitle: String
    let location: String
    let status: String
    let isHost: Bool
    let isApply: Bool
    let currentPeopleCount: Int
    let maxPeopleCount: Int
    let introduction: String
    let category: String
    let coverImg: Int
    let weekDay: String
    let weekDate: String?
    let startTime: Double
    let endTime: Double
}
