//
//  BaseResponse.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/12/25.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    var success: Bool
    var code: Int
    var message: String?
    var data: T?
}
