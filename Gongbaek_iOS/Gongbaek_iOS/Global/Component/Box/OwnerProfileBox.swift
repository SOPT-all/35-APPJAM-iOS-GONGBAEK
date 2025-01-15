//
//  OwnerProfileBox.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

// MARK: - TODO: Model로 분리

struct OwnerProfileData {
    var profileImage: Int
    var nickname: String
    var sex: String
    var schoolMajor: String
    var enterYear: Int
    var schoolGrade: Int
    var mbti: String
}

struct OwnerProfileBox: View {
    let ownerData: OwnerProfileData
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 4)
                .fill(.gray01)
            
            HStack(alignment: .center, spacing: 12) {
                Image(" ") // MARK: - TODO: 이미지 네이밍 수정
                    .resizable()
                    .frame(width: 80, height: 80)
                    .background(.gray04) // MARK: - TODO: 이미지 삽입 시 삭제
                    .foregroundStyle(.mainOrange) // MARK: - TODO: 이미지 삽입 시 삭제
                
                VStack(alignment: .leading, spacing: 6) {
                    HStack(spacing: 6) {
                        Text(ownerData.nickname)
                            .pretendardFont(.body1_b_16)
                            .foregroundStyle(.grayBlack)
                        
                        Image(ownerData.sex == "MAN" ? .icMale20 : .icFemale20)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.gray06)
                    }
                    
                    MajorChip(major: ownerData.schoolMajor, targetObject: .ownerProfile)
                    
                    HStack(spacing: 6) {
                        ProfileDetailChip(detailCategory: "학번/학년")
                        Text("\(ownerData.enterYear%100)학번 \(ownerData.schoolGrade)학년")
                            .foregroundStyle(.gray08)
                            .pretendardFont(.caption2_m_12)
                            .padding(.trailing, 6)
                        ProfileDetailChip(detailCategory: "MBTI")
                        Text(ownerData.mbti)
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
    OwnerProfileBox(ownerData: OwnerProfileData(profileImage: 1, nickname: "로이임탄", sex: "MALE", schoolMajor: "글로벌문화산업/MICE 전공", enterYear: 2019, schoolGrade: 4, mbti: "ENFJ"))
}
