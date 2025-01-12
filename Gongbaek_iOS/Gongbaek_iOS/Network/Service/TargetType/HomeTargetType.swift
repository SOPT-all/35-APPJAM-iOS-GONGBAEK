//
//  HomeTargetType.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/12/25.
//

import Moya

enum HomeTargetType {
    case getUpcomingMeeting
}

extension HomeTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .getUpcomingMeeting:
            return APIConstants.hasTokenHeader
        }
    }
    
    var path: String {
        switch self {
        case .getUpcomingMeeting:
            return "api/v1/group/my/participation"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUpcomingMeeting:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getUpcomingMeeting:
            return .requestPlain
        }
    }
}
