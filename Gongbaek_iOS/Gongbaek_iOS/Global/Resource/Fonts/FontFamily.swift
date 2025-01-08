//
//  Font+.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/8/25.
//

import SwiftUI

enum PretendardFont: String {
    case bold = "Pretendard-Bold"
    case semiBold = "Pretendard-SemiBold"
    case medium = "Pretendard-Medium"
    case regular = "Pretendard-Regular"
}

struct FontFamiliy {
    let fontName: PretendardFont
    let fontSize: CGFloat
    let lineHeight: CGFloat
    let letterSpacing: CGFloat
}

extension FontFamiliy {
    // head
    static let head1_b_30: FontFamiliy = .init(fontName: .bold, fontSize: 30, lineHeight: 30, letterSpacing: -1)
    
    static let head2_b_24: FontFamiliy = .init(fontName: .bold, fontSize: 24, lineHeight: 26, letterSpacing: -1)
    static let head2_m_24: FontFamiliy = .init(fontName: .medium, fontSize: 24, lineHeight: 26, letterSpacing: -1)
    static let head2_r_24: FontFamiliy = .init(fontName: .regular, fontSize: 24, lineHeight: 26, letterSpacing: -1)
    
    // title
    static let title1_b_20: FontFamiliy = .init(fontName: .bold, fontSize: 20, lineHeight: 26, letterSpacing: -1)
    static let title1_m_20: FontFamiliy = .init(fontName: .medium, fontSize: 20, lineHeight: 26, letterSpacing: -1)
    static let title1_r_20: FontFamiliy = .init(fontName: .regular, fontSize: 20, lineHeight: 26, letterSpacing: -1)
    
    static let title2_b_18: FontFamiliy = .init(fontName: .bold, fontSize: 18, lineHeight: 22, letterSpacing: -0.5)
    static let title2_sb_18: FontFamiliy = .init(fontName: .semiBold, fontSize: 18, lineHeight: 22, letterSpacing: -0.5)
    static let title2_m_18: FontFamiliy = .init(fontName: .medium, fontSize: 18, lineHeight: 22, letterSpacing: -0.5)
    static let title2_r_18: FontFamiliy = .init(fontName: .regular, fontSize: 18, lineHeight: 22, letterSpacing: -0.5)
    
    // body
    static let body1_b_16: FontFamiliy = .init(fontName: .bold, fontSize: 16, lineHeight: 20, letterSpacing: -0.5)
    static let body1_sb_16: FontFamiliy = .init(fontName: .semiBold, fontSize: 16, lineHeight: 20, letterSpacing: -0.5)
    static let body1_m_16: FontFamiliy = .init(fontName: .medium, fontSize: 16, lineHeight: 20, letterSpacing: -0.5)
    static let body1_r_16: FontFamiliy = .init(fontName: .regular, fontSize: 16, lineHeight: 20, letterSpacing: -0.5)
    
    static let body2_b_14: FontFamiliy = .init(fontName: .bold, fontSize: 14, lineHeight: 18, letterSpacing: -0.5)
    static let body2_sb_14: FontFamiliy = .init(fontName: .semiBold, fontSize: 14, lineHeight: 18, letterSpacing: -0.5)
    static let body2_m_14: FontFamiliy = .init(fontName: .medium, fontSize: 14, lineHeight: 18, letterSpacing: -0.5)
    static let body2_r_14: FontFamiliy = .init(fontName: .regular, fontSize: 14, lineHeight: 18, letterSpacing: -0.5)
    
    // caption
    static let caption1_sb_13: FontFamiliy = .init(fontName: .semiBold, fontSize: 13, lineHeight: 18, letterSpacing: -0.5)
    static let caption1_m_13: FontFamiliy = .init(fontName: .medium, fontSize: 13, lineHeight: 18, letterSpacing: -0.5)
    static let caption1_r_13: FontFamiliy = .init(fontName: .regular, fontSize: 13, lineHeight: 18, letterSpacing: -0.5)
    
    static let caption1_b_12: FontFamiliy = .init(fontName: .bold, fontSize: 12, lineHeight: 18, letterSpacing: -0.5)
    static let caption1_m_12: FontFamiliy = .init(fontName: .medium, fontSize: 12, lineHeight: 18, letterSpacing: -0.5)
    static let caption1_r_12: FontFamiliy = .init(fontName: .regular, fontSize: 12, lineHeight: 18, letterSpacing: -0.5)
}
