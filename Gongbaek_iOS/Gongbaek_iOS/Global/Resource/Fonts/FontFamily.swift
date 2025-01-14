//
//  FontFamily.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/8/25.
//

import SwiftUI

enum PretendardFont: String {
    case bold = "Pretendard-Bold"
    case semiBold = "Pretendard-SemiBold"
    case medium = "Pretendard-Medium"
    case regular = "Pretendard-Regular"
}

struct FontFamily {
    let fontName: PretendardFont
    let fontSize: CGFloat
    let lineHeight: CGFloat
    let letterSpacing: CGFloat
}

extension FontFamily {
    // head
    static let head1_b_30 = FontFamily(fontName: .bold, fontSize: 30, lineHeight: 30, letterSpacing: -1)
    
    static let head2_b_24 = FontFamily(fontName: .bold, fontSize: 24, lineHeight: 26, letterSpacing: -1)
    static let head2_m_24 = FontFamily(fontName: .medium, fontSize: 24, lineHeight: 26, letterSpacing: -1)
    static let head2_r_24 = FontFamily(fontName: .regular, fontSize: 24, lineHeight: 26, letterSpacing: -1)
    
    // title
    static let title1_b_20 = FontFamily(fontName: .bold, fontSize: 20, lineHeight: 26, letterSpacing: -1)
    static let title1_m_20 = FontFamily(fontName: .medium, fontSize: 20, lineHeight: 26, letterSpacing: -1)
    static let title1_r_20 = FontFamily(fontName: .regular, fontSize: 20, lineHeight: 26, letterSpacing: -1)
    
    static let title2_b_18 = FontFamily(fontName: .bold, fontSize: 18, lineHeight: 22, letterSpacing: -0.5)
    static let title2_sb_18 = FontFamily(fontName: .semiBold, fontSize: 18, lineHeight: 22, letterSpacing: -0.5)
    static let title2_m_18 = FontFamily(fontName: .medium, fontSize: 18, lineHeight: 22, letterSpacing: -0.5)
    static let title2_r_18 = FontFamily(fontName: .regular, fontSize: 18, lineHeight: 22, letterSpacing: -0.5)
    
    // body
    static let body1_b_16 = FontFamily(fontName: .bold, fontSize: 16, lineHeight: 20, letterSpacing: -0.5)
    static let body1_sb_16 = FontFamily(fontName: .semiBold, fontSize: 16, lineHeight: 20, letterSpacing: -0.5)
    static let body1_m_16 = FontFamily(fontName: .medium, fontSize: 16, lineHeight: 20, letterSpacing: -0.5)
    static let body1_r_16 = FontFamily(fontName: .regular, fontSize: 16, lineHeight: 20, letterSpacing: -0.5)
    
    static let body2_b_14 = FontFamily(fontName: .bold, fontSize: 14, lineHeight: 18, letterSpacing: -0.5)
    static let body2_sb_14 = FontFamily(fontName: .semiBold, fontSize: 14, lineHeight: 18, letterSpacing: -0.5)
    static let body2_m_14 = FontFamily(fontName: .medium, fontSize: 14, lineHeight: 18, letterSpacing: -0.5)
    static let body2_r_14 = FontFamily(fontName: .regular, fontSize: 14, lineHeight: 18, letterSpacing: -0.5)
    
    // caption
    static let caption1_sb_13 = FontFamily(fontName: .semiBold, fontSize: 13, lineHeight: 18, letterSpacing: -0.5)
    static let caption1_m_13 = FontFamily(fontName: .medium, fontSize: 13, lineHeight: 18, letterSpacing: -0.5)
    static let caption1_r_13 = FontFamily(fontName: .regular, fontSize: 13, lineHeight: 18, letterSpacing: -0.5)
    
    static let caption2_b_12 = FontFamily(fontName: .bold, fontSize: 12, lineHeight: 18, letterSpacing: -0.5)
    static let caption2_m_12 = FontFamily(fontName: .medium, fontSize: 12, lineHeight: 18, letterSpacing: -0.5)
    static let caption2_r_12 = FontFamily(fontName: .regular, fontSize: 12, lineHeight: 18, letterSpacing: -0.5)
}
