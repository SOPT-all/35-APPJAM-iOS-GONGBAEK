//
//  TextField+.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

extension TextField {
    func pretendardFont(_ font: FontFamily) -> some View {
        let lineSpacingValue = font.lineHeight - font.fontSize
        
        return self.font(.pretendard(font))
            .tracking(font.letterSpacing)
            .padding(.vertical, lineSpacingValue/2)
    }
}
