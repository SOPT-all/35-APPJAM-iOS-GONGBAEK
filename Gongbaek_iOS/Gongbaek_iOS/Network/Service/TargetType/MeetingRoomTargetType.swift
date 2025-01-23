//
//  MeetingRoomTargetType.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/23/25.
//

import Moya

enum MeetingRoomTargetType {
    case getMembers(isPublic: Bool, groupId: Int, groupType: String)
    case getMeetingDetails(groupId: Int, groupType: String)
    case getComments(isPublic: Bool, groupId: Int, groupType: String)
    case postComment(data: PostMeetingRoomRequestBodyDTO)
}

extension MeetingRoomTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .getMembers:
            return APIConstants.hasTokenHeader
        case .getMeetingDetails:
            return APIConstants.hasTokenHeader
        case .getComments:
            return APIConstants.hasTokenHeader
        case .postComment:
            return APIConstants.hasTokenHeader
        }
    }
    
    var path: String {
        switch self {
        case .getMembers:
            return "/api/v1/fill/members"
        case .getMeetingDetails:
            return "/api/v1/fill/info"
        case .getComments:
            return "/api/v1/comments"
        case .postComment:
            return "/api/v1/comment"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMembers:
            return .get
        case .getMeetingDetails:
            return .get
        case .getComments:
            return .get
        case .postComment:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMembers(_, let groupId, let groupType):
            return .requestParameters(
                parameters: [
                    "isPublic": false,
                    "groupId": groupId,
                    "groupType": groupType
                ],
                encoding: URLEncoding.queryString
            )
        case .getMeetingDetails(let groupId, let groupType):
            return .requestParameters(
                parameters: [
                    "groupId": groupId,
                    "groupType": groupType
                ],
                encoding: URLEncoding.queryString
            )
        case .getComments(_, let groupId, let groupType):
            return .requestParameters(
                parameters: [
                    "isPublic": false,
                    "groupId": groupId,
                    "groupType": groupType
                ],
                encoding: URLEncoding.queryString
            )
        case .postComment(let data):
            return .requestJSONEncodable(data)
        }
    }
}
