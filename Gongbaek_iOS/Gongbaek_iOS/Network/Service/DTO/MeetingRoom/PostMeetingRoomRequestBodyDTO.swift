//
//  PostMeetingRoomRequestBodyDTO.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/23/25.
//

struct PostMeetingRoomRequestBodyDTO: Codable {
    let groupId: Int
    let groupType: String
    let isPublic: Bool
    let body: String
}
