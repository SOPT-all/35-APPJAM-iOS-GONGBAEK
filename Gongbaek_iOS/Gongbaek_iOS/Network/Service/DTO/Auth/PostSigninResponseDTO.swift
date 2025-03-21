//
//  PostSigninResponseDTO.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/20/25.
//

import Foundation

struct PostSigninResponseDTO: Codable {
    let userId: Int?
    let accessToken: String
    let refreshToken: String
}
