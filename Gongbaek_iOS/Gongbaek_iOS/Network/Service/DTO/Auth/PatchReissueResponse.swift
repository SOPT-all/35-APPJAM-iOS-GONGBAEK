//
//  PatchReissueResponse.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/21/25.
//

import Foundation

struct PatchReissueResponse: Codable {
    let userId: Int?
    let accessToken: String
    let refreshToken: String
}
