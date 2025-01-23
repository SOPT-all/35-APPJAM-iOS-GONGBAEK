//
//  MeetingRoomViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/22/25.
//

import SwiftUI

final class MeetingRoomViewModel: ObservableObject {
    @Published var meetingDetailData: GetMeetingRoomDetailsResponseDTO? = nil
    @Published var memberData: GetMeetingRoomMembersResponseDTO? = nil
    @Published var commentData: GetMeetingRoomCommentsResponseDTO? = nil
    
    var meetingStates: [MeetingChipState] {
        [
            RecruitingState(meetingDetailData?.status).map { .recruiting($0) },
            CategoryState(meetingDetailData?.category).map { .category($0) },
            GroupState(meetingDetailData?.groupType).map { .weekly($0) }
        ].compactMap { $0 }
    }
    
    var groupTitle: String {
        meetingDetailData?.groupTitle ?? ""
    }
    
    var weekDay: String {
        meetingDetailData?.weekDay ?? ""
    }
    
    var weekDate: String {
        meetingDetailData?.weekDate ?? ""
    }
    
    var startTime: Double {
        meetingDetailData?.startTime ?? 0
    }
    
    var endTime: Double {
        meetingDetailData?.endTime ?? 0
    }
    
    var location: String {
        meetingDetailData?.location ?? ""
    }
    
    var memberCount: String {
        let current = meetingDetailData?.currentPeopleCount ?? 0
        let max = meetingDetailData?.maxPeopleCount ?? 0
        return "멤버 (\(current)/\(max)명)"
    }
    
    var isCommentDisabled: Bool {
        RecruitingState(commentData?.groupStatus) == .CLOSED
    }
    
    @Published var isSuccessGetData: Bool = true

}

extension MeetingRoomViewModel {
    func getMembers(
        groupId: Int,
        groupType: String,
        completion: @escaping (GetMeetingRoomMembersResponseDTO) -> ()
    ) {
        Providers.meetingRoomProvider.request(
            target: .getMembers(isPublic: false, groupId: groupId, groupType: groupType),
            instance: BaseResponse<GetMeetingRoomMembersResponseDTO>.self
        ) { response in
            print(response)
            self.memberData = response.data
        }
    }
    
    func getDetails(
        groupId: Int,
        groupType: String,
        completion: @escaping (GetMeetingRoomDetailsResponseDTO) -> ()
    ) {
        Providers.meetingRoomProvider.request(
            target: .getMeetingDetails(groupId: groupId, groupType: groupType),
            instance: BaseResponse<GetMeetingRoomDetailsResponseDTO>.self
        ) { response in
            print(response)
            self.meetingDetailData = response.data
        }
    }
    
    func getComments(
        groupId: Int,
        groupType: String,
        completion: @escaping (GetMeetingRoomCommentsResponseDTO) -> ()
    ) {
        Providers.meetingRoomProvider.request(
            target: .getComments(isPublic: false, groupId: groupId, groupType: groupType),
            instance: BaseResponse<GetMeetingRoomCommentsResponseDTO>.self
        ) { response in
            print(response)
            self.commentData = response.data
        }
    }
    
    //TODO: 댓글 작성 API 로직 필요
    func postComment(groupId: Int, groupType: String, commentContent: String) {
        let requestData = PostMeetingRoomRequestBodyDTO(
            groupId: groupId,
            groupType: groupType,
            isPublic: false,
            body: commentContent
        )
        
        Providers.meetingRoomProvider.request(target: .postComment(data: requestData), instance: BaseResponse<EmptyResponseDTO>.self) { response in
            print(requestData)
            DispatchQueue.main.async {
                if response.success {
                    self.isSuccessGetData = true
                    print("✅ 댓글 등록 성공!")
                } else {
                    self.isSuccessGetData = false
                    print("❌ 댓글 등록 실패: \(response.message ?? "알 수 없는 오류")")
                }
                self.getComments(groupId: groupId, groupType: groupType) { _ in
                    print("getComments finished, memberData: \(String(describing: self.commentData))")
                }
            }
        }
    }
}
