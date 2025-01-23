//
//  GetFillingResponseDTO.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/23/25.
//

import Foundation

struct GetFillingResponseDTO: Codable {
    let groupId: Int
    let category: String
    let coverImg: Int
    let groupType: String
    let groupTitle: String
    let weekDay: String?
    let weekDate: String?
    let startTime: Double
    let endTime: Double
    let location: String
}
