//
//  CounterControlButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/11/25.
//

import SwiftUI

struct CounterButton: View {
    var state: CounterButtonState
    var onTap: (() -> Void)?
    
    var body: some View {
        Button(action: {
            onTap?()
        }) {
            Image(state == .increase ? .icPlusOrange18 : .icMinusOrange18)
                .resizable()
                .foregroundColor(.mainOrange)
                .frame(width: 18, height: 18)
        }
        .frame(width: 48, height: 48)
        .background(.subOrange)
        .buttonStyle(PlainButtonStyle())
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    CounterButton(state: .increase)
}
