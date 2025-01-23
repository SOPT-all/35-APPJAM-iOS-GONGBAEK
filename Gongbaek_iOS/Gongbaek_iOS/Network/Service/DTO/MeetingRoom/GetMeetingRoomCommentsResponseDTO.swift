//
//  GetMeetingRoomCommentsResponseDTO.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/23/25.
//

import Foundation

struct GetMeetingRoomCommentsResponseDTO: Codable {
    let commentCount: Int
    let groupId: Int
    let groupType: String
    let groupStatus: String
    let comments: [Comment]
}

struct Comment: Codable {
    var commentId: Int
    var isWriter: Bool
    var isGroupHost: Bool
    var nickname: String
    var body: String
    var createdAt: String
}
