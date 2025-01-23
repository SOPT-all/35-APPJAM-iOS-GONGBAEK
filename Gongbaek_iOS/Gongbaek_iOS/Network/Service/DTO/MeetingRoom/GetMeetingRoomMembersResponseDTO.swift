//
//  GetMeetingRoomMembersResponseDTO.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/23/25.
//

import Foundation

struct GetMeetingRoomMembersResponseDTO: Codable {
    var maxPeopleCount: Int
    var currentPeopleCount: Int
    var members: [MemberModel]
}

struct MemberModel: Codable {
    var profileImg: Int
    var isHost: Bool
    var nickname: String
}
