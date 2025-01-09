//
//  Font+.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/9/25.
//

import SwiftUI

extension Font {
    static func pretendard(_ font: FontFamily) -> Font {
        .custom(font.fontName.rawValue, size: font.fontSize)
    }
}
