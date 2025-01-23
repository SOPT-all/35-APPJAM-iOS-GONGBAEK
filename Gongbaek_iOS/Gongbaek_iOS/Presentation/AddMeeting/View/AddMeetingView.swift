///
//  CycleSelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct AddMeetingView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var viewModel: AddMeetingViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Button(action: {
                        if viewModel.currentIndex == 0 {
                            navigationManager.pop()
                        } else {
                            viewModel.currentIndex -= 1
                        }
                    }) {
                        Image(.icArrowLeft48)
                            .foregroundColor(.gray04)
                            .frame(width: 48, height: 48)
                    }
                }
                
                ProgressBar(currentIndex: viewModel.currentIndex)
                    .padding(.bottom, 40)
                
                switch viewModel.currentIndex {
                case 0:
                    CycleSelect(viewModel: viewModel)
                case 1:
                    if viewModel.selectedCycle == .once {
                        CalendarSelect(viewModel: viewModel)
                    } else if viewModel.selectedCycle == .weekly {
                        WeekDaySelect(viewModel: viewModel)
                    }
                case 2:
                    TimeSelect(viewModel: viewModel)
                case 3:
                    CategorySelect(viewModel: viewModel)
                case 4:
                    CoverImageSelect(viewModel: viewModel)
                case 5:
                    LocationInput(viewModel: viewModel)
                case 6:
                    IntroduceInput(viewModel: viewModel)
                default:
                    CheckInputInfo(viewModel: viewModel)
                }
                
                Spacer()
                
                let isLastStep = viewModel.currentIndex == viewModel.totalSteps - 1
                
                BasicButton(
                    text: isLastStep ? "등록하기" : "다음",
                    isActivated: viewModel.isNextEnabled
                ) {
                    if isLastStep {
                        viewModel.postMeeting()
                        viewModel.showAlert = true
                    } else {
                        viewModel.goToNextPage()
                    }
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 16)
            }
            
            let image = viewModel.isSuccessGetData ? "img_success" : "img_fail"
            
            if viewModel.showAlert {
                CustomedAlert(
                    alertImage: image ,
                    titleText: viewModel.isSuccessGetData ? "모임 등록이 완료됐어요!" : "모임 등록에 실패했어요!",
                    orangeButtonText: "확인",
                    onTapOrangeButton: {
                        viewModel.showAlert = false
                        if viewModel.isSuccessGetData {
                            //TODO: 나의 채움 탭으로 이동
                        }
                    }
                )
            }
        }
    }
}

#Preview {
    @Previewable @State var viewModel = AddMeetingViewModel()
    CoverImageSelect(viewModel: viewModel)
}





