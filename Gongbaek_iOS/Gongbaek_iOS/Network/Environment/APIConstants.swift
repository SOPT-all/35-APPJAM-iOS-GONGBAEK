//
//  APIConstants.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/12/25.
//

import Foundation

import Moya

struct APIConstants{
    static let contentType = "Content-Type"
    static let applicationJSON = "application/json"
    static let auth = "Authorization"
    static let access = "accessToken"
    static let refresh = "refreshToken"
    static let accessToken = "Bearer " + "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxIiwiZXhwIjoxODIzNDQyODE0LCJ1c2VySWQiOjF9.piiJ8o2pXY-_A6ZjvxQ7MOyfnYOsnM-FQwMmC3m4qWIzK0wlxBb6tEfT3HzLuIU1SoZTveGeCEq7g6JABYmx2A"
    static let refreshToken = "Bearer " + ""
    static var authCode = ""
    static let Bearer = "Bearer "
}

extension APIConstants{
    static let authCodeHeader = [contentType: applicationJSON,
                                        auth: Bearer + authCode]
    static let hasTokenHeader = [contentType: applicationJSON,
                                        auth: accessToken]
    static let hasContentTypeHeader = [contentType: applicationJSON]
}
