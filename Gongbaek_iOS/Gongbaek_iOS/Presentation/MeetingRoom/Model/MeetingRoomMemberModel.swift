//
//  MeetingRoomMemberModel.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

struct MeetingRoomMemberModel {
    var maxPeopleCount: Int
    var currentPeopleCount: Int
    var members: [MemberModel]
}

//let dummyMeetingRoomMemberData: MeetingRoomMemberModel = MeetingRoomMemberModel(
//    maxPeopleCount: 7,
//    currentPeopleCount: 6,
//    members: [
//        MemberModel(
//            profileImage: 1,
//            isHost: true,
//            nickname: "희은이"
//        ),
//        MemberModel(
//            profileImage: 2,
//            isHost: false,
//            nickname: "파이리"
//        ),
//        MemberModel(
//            profileImage: 3,
//            isHost: false,
//            nickname: "훈발놈"
//        ),
//        MemberModel(
//            profileImage: 4,
//            isHost: false,
//            nickname: "노는게젤조아"
//        ),
//        MemberModel(
//            profileImage: 4,
//            isHost: false,
//            nickname: "응애기"
//        ),
//        MemberModel(
//            profileImage: 4,
//            isHost: false,
//            nickname: "퇴사핑"
//        )]
//)
