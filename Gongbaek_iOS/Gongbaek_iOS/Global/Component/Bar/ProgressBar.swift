//
//  ProgressBar.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/15/25.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var currentIndex: Int
    var totalViews: Int = 8
    var progressRatio: CGFloat {
        totalViews > 0 ? CGFloat(currentIndex + 1) / CGFloat(totalViews) : 0
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.gray02)
                    .frame(height: 7)
                Rectangle()
                    .fill(.gray10)
                    .frame(
                        width: geometry.size.width * progressRatio,
                        height: 7
                    )
                    .animation(.easeInOut, value: currentIndex)
            }
        }
        .frame(height: 7)
    }
}

#Preview {
    @Previewable @State var currentIndex = 1
    VStack(spacing: 16) {
        ForEach(0..<8) { index in
            ProgressBar(currentIndex: .constant(index))
        }
    }
}
