//
//  AddMeetingButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/11/25.
//

import SwiftUI

struct AddMeetingButton: View {
    var onClick: (() -> Void)?

    var body: some View {
        Button(action: {
            onClick?()
        }) {
            Image(.icPlus24)
                .resizable()
                .foregroundColor(.grayWhite)
                .frame(width: 24, height: 24)
        }
        .frame(width: 64, height: 64)
        .background(.mainOrange)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .shadow(color: Color.black.opacity(0.25), radius: 18, x: 0, y: 4)
    }
}

#Preview {
    AddMeetingButton()
}
