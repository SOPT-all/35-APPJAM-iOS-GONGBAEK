//
//  CustomTextEditor.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/15/25.
//

import SwiftUI

struct CustomTextEditor: View {
    @State var text = ""
    @FocusState var isEditing: Bool
    let maxCharacterCount = 100

    var body: some View {
        VStack(alignment: .leading) {
            Text("소개글")
                .font(.pretendard(.body2_sb_14))
                .foregroundColor(.gray08)

            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text("간단한 소개글을 20자 이상 작성해보세요.\nex) 화석된 사람들끼리 소소한 점심 모임 어때요?")
                        .foregroundColor(.gray04)
                        .padding(EdgeInsets(top: 14, leading: 16, bottom: 14, trailing: 16))
                }

                TextEditor(text: $text)
                    .padding(EdgeInsets(top: 7, leading: 10, bottom: 0, trailing: 4))
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    .onChange(of: text) { [text] in
                        if text.count > maxCharacterCount {
                            self.text = String(text.prefix(maxCharacterCount))
                        }
                    }
                    .focused($isEditing)
            }
            .font(.pretendard(.body1_m_16))
            .background(.gray01)
            .accentColor(.gray05)
            .frame(height: 143)
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(isEditing ? .gray10 : Color.clear, lineWidth: 1)
            )

            HStack {
                Spacer()
                Text("\(text.count)/\(maxCharacterCount)")
                    .font(.pretendard(.caption2_r_12))
                    .foregroundColor(.gray06)
            }
        }
    }
}

#Preview {
    CustomTextEditor()
        .padding(16)
}
