//
//  OwnerProfileBox.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct OwnerProfileBox: View {
    var profileImage: Int
    var nickname: String
    var sex: String
    var schoolMajor: String
    var enterYear: Int
    var schoolGrade: Int
    var mbti: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 4)
                .fill(.gray01)
            
            HStack(alignment: .center, spacing: 12) {
                
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .background(.gray04) // MARK: - 이미지 삽입 시 삭제
                    .foregroundStyle(.mainOrange)
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    HStack(spacing: 6) {
                        
                        Text(nickname)
                            .pretendardFont(.body1_b_16)
                            .foregroundStyle(.grayBlack)
                        
                        Image(sex == "MAN" ? "ic_male_20" : "ic_female_20")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.gray06)
                    }
                    
                    MajorChip(major: schoolMajor, targetObject: .ownerProfile)
                    
                    HStack(spacing: 6) {
                        
                        ProfileDetailChip(detailCategory: "학번/학년")
//
                        Text("\(enterYear%100)학번 \(schoolGrade)학년")
                            .foregroundStyle(.gray08)
                            .pretendardFont(.caption2_m_12)
                            .padding(.trailing, 6)
                        
                        ProfileDetailChip(detailCategory: "MBTI")
                        
                        Text(mbti)
                            .foregroundStyle(.gray08)
                            .pretendardFont(.caption2_m_12)
                    }
                }
            }
            .padding(10)
        }
    }
}

#Preview {
    OwnerProfileBox(profileImage: 1, nickname: "로이임탄", sex: "MALE", schoolMajor: "글로벌문화산업/MICE 전공", enterYear: 2019, schoolGrade: 4, mbti: "ENFJ")
}
