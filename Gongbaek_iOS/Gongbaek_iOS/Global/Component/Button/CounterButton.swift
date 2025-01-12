//
//  CounterControlButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/11/25.
//

import SwiftUI

enum CounterButtonState {
    case increase
    case decrease
}

struct CounterButton: View {
    var state: CounterButtonState
    var onClick: (() -> Void)?
    
    var body: some View {
        Button(action: {
            onClick?()
        }) {
            // TODO: 아이콘 변경
            Image(systemName: state == .increase ? "plus.circle" : "minus.circle")
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
