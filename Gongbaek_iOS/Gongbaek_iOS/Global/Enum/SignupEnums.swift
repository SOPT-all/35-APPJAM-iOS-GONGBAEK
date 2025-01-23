//
//  GradeState.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/20/25.
//

import SwiftUI

enum SignupStep: Int, CaseIterable {
    case profileSelection = 0
    case nicknameInput
    case schoolMajorInput
    case gradeAdmissionYearInput
    case mbtiSelection
    case sexSelection
    case selfIntroductionWriting
    case classTimeTableInput
    case freeTimeTableConversion
    case signupCompletion
    
    @ViewBuilder
    func view(
        viewModel: SignupViewModel,
        navigationManager: NavigationManager
    ) -> some View {
        switch self {
        case .profileSelection:
            ProfileSelectionView(viewModel: viewModel)
        case .nicknameInput:
            NicknameInputView(viewModel: viewModel)
        case .schoolMajorInput:
            SchoolMajorInputView(
                viewModel: viewModel,
                onTapSchoolSearchButton: {
                    viewModel.resetSearchState()
                    navigationManager.present(.schoolMajorSearchView(viewModel, .school))
                },
                onTapMajorSearchButton: {
                    viewModel.resetSearchState()
                    navigationManager.present(.schoolMajorSearchView(viewModel, .major))
                }
            )
        case .gradeAdmissionYearInput:
            GradeAdmissionYearInputView(viewModel: viewModel)
        case .mbtiSelection:
            MbtiSelectionView(viewModel: viewModel)
        case .sexSelection:
            SexSelectionView(viewModel: viewModel)
        case .selfIntroductionWriting:
            SelfIntroductionWritingView(viewModel: viewModel)
        case .classTimeTableInput:
            ClassTimeTableInputView(viewModel: viewModel)
        case .freeTimeTableConversion:
            FreeTimeTableConversionView(viewModel: viewModel)
        case .signupCompletion:
            SignupCompletionView()
        }
    }
}

enum ProfileImageMap: String, CaseIterable {
    case profile0 = "profile_image_0"
    case profile1 = "profile_image_1"
    case profile2 = "profile_image_2"
    case profile3 = "profile_image_3"
    case profile4 = "profile_image_4"
    case profile5 = "profile_image_5"
    
    static func from(_ profileImg: Int) -> ProfileImageMap {
        return ProfileImageMap(rawValue: "profile_image_\(profileImg)") ?? .profile0
    }
}

enum GradeState: String, CaseIterable {
    case one = "1학년"
    case two = "2학년"
    case three = "3학년"
    case four = "4학년"
}

enum MBTI {
    case ei
    case sn
    case tf
    case jp
    
    var text: String {
        switch self {
        case .ei: "외항형/내향형"
        case .sn: "감각형/직관형"
        case .tf: "사고형/감정형"
        case .jp: "판단형/인식형"
        }
    }
}

enum MBTI_ei: String, CaseIterable {
    case E
    case I
}

enum MBTI_sn: String, CaseIterable {
    case S
    case N
}

enum MBTI_tf: String, CaseIterable {
    case T
    case F
}

enum MBTI_jp: String, CaseIterable {
    case J
    case P
}

enum SexType: String, CaseIterable {
    case MAN
    case WOMAN
    
    var text: String {
        switch self {
        case .MAN: "남자"
        case .WOMAN: "여자"
        }
    }
}
