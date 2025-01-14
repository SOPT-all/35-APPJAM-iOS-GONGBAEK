//
//  GetUpcomingMeetingResponseDTO.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/13/25.
//

import Foundation

struct GetUpcomingMeetingResponseDTO: Codable {
    let groupId: Int
    let category: String
    let profileImg: Int
    let groupType: String
    let groupTitle: String
    let weekDay: String?
    let weekDate: String?
    let startTime: Double
    let endTime: Double
    let location: String
}
