//
//  Text+.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/9/25.
//

import SwiftUI

extension Text {
    func pretendardFont(_ font: FontFamily) -> some View {
        let lineSpacingValue = font.lineHeight - font.fontSize
            
        return self.font(.pretendard(font))
            .tracking(font.letterSpacing)
            .lineSpacing(lineSpacingValue)
            .padding(.vertical, lineSpacingValue/2)
    }
}
