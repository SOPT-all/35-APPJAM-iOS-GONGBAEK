//
//  Text+.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/9/25.
//

import SwiftUI

extension Text {
    static func addFont(_ text: Text, font: FontFamiliy?) -> some View {
        let fontName = font?.fontName.rawValue ?? "Pretendard-Regular"
        let fontSize = font?.fontSize ?? 16
        let lineHeight = font?.lineHeight ?? 0
        let letterSpacing = font?.letterSpacing ?? 0
        
        let lineSpacingValue = lineHeight - fontSize
        
        return text
            .font(.custom(fontName, size: CGFloat(fontSize)))
            .tracking(CGFloat(letterSpacing))
            .lineSpacing(CGFloat(lineSpacingValue))
            .padding(.vertical, CGFloat(lineSpacingValue))
    }
}

#Preview {
    ContentView()
}
