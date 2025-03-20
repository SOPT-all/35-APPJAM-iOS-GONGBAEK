//
//  MultiColoredText.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/20/25.
//

import SwiftUI

//특정 문자열 색상 바꿔줌
struct MultiColoredText: View {
    var originalText: String
    var coloredSubstrings: [(String, Color)]
    
    var body: some View {
        let textFragments: [Text] = createColoredTextFragments()
        return textFragments.reduce(Text(""), +)
    }
    
    private func createColoredTextFragments() -> [Text] {
        var fragments: [Text] = []
        var currentIndex = originalText.startIndex
        
        for (substring, color) in coloredSubstrings {
            if let range = originalText.range(of: substring, range: currentIndex..<originalText.endIndex) {
                let beforeText = originalText[currentIndex..<range.lowerBound]
                let highlightedText = originalText[range]
                
                if !beforeText.isEmpty {
                    fragments.append(Text(beforeText))
                }
                fragments.append(Text(highlightedText).foregroundColor(color))
                currentIndex = range.upperBound
            }
        }
        
        let remainingText = originalText[currentIndex...]
        if !remainingText.isEmpty {
            fragments.append(Text(remainingText))
        }
        
        return fragments
    }
}
