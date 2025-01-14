//
//  Providers.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/12/25.
//

import Foundation

import Moya

struct Providers {
    static let homeProvider = NetworkProvider<HomeTargetType>(withAuth: false)
}

extension MoyaProvider {
    convenience init(withAuth: Bool) {
//        if withAuth {
//            self.init(session: Session(interceptor: AuthInterceptor.shared),
//                      plugins: [MoyaLoggingPlugin()])
//        } else {
            self.init(plugins: [MoyaLoggingPlugin()])
//        }
    }
}
