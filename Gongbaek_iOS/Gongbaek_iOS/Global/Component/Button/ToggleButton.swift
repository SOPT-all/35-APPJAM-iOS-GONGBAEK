//
//  ToggleButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/11/25.
//

import SwiftUI

struct ToggleButton: View {
    @Binding var isOn: Bool
    
    var body: some View {
        ZStack {
            // 배경
            RoundedRectangle(cornerRadius: 20)
                .fill(isOn ? .mainOrange : .gray06)
                .frame(width: 42, height: 24)
                .animation(.easeInOut(duration: 0.2), value: isOn)
            
            // 스위치 동그라미
            Circle()
                .fill(.white)
                .frame(width: 18, height: 18)
                .offset(x: isOn ? 9 : -9)
                .animation(.easeInOut(duration: 0.2), value: isOn)
        }
        .onTapGesture {
            isOn.toggle()
        }
    }
}

#Preview {
    @Previewable @State var toggleState: Bool = false
    ToggleButton(isOn: $toggleState)
}
