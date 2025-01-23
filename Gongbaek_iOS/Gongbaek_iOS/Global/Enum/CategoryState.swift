//
//  CategoryState.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/15/25.
//

import SwiftUI

enum CategoryState: Int, CaseIterable {
    case ALL = 0
    case STUDY = 1
    case DINING = 2
    case EXERCISE = 3
    case NETWORKING = 4
    case PLAYING = 5
    case OTHERS = 6
    
    init?(_ serverValue: String?) {
        switch serverValue?.uppercased() {
        case "ALL":
            self = .ALL
        case "STUDY":
            self = .STUDY
        case "DINING":
            self = .DINING
        case "EXERCISE":
            self = .EXERCISE
        case "NETWORKING":
            self = .NETWORKING
        case "PLAYING":
            self = .PLAYING
        case "OTHERS":
            self = .OTHERS
        default:
            return nil
        }
    }
    
    var serverName: String {
        switch self {
        case .ALL: return ""
        case .STUDY: return "STUDY"
        case .DINING: return "DINING"
        case .EXERCISE: return "EXERCISE"
        case .NETWORKING: return "NETWORKING"
        case .PLAYING: return "PLAYING"
        case .OTHERS: return "OTHERS"
        }
    }
    
    var categoryImage: Image? {
        switch self {
        case .ALL: return nil
        case .STUDY: return Image(.imgCategoryStudy)
        case .DINING: return Image(.imgCategoryDining)
        case .EXERCISE: return Image(.imgCategoryExercise)
        case .NETWORKING: return Image(.imgCategoryNetworking)
        case .PLAYING: return Image(.imgCategoryPlay)
        case .OTHERS: return Image(.imgCategoryOthers)
        }
    }
    
    var categoryName: String {
        switch self {
        case .ALL: return "전체"
        case .STUDY: return "스터디"
        case .DINING: return "식사"
        case .EXERCISE: return "운동/산책"
        case .NETWORKING: return "네트워킹"
        case .PLAYING: return "취미/오락"
        case .OTHERS: return "기타"
        }
    }
    
    var coverImage: [String] {
        switch self {
        case .ALL: return []
        case .STUDY: return ["img_cover_study_1", "img_cover_study_2", "img_cover_study_3", "img_cover_study_4", "img_cover_study_5", "img_cover_study_6"]
        case .DINING: return ["img_cover_dining_1", "img_cover_dining_2", "img_cover_dining_3", "img_cover_dining_4", "img_cover_dining_5", "img_cover_dining_6"]
        case .EXERCISE: return ["img_cover_exercise_1", "img_cover_exercise_2", "img_cover_exercise_3", "img_cover_exercise_4", "img_cover_exercise_5", "img_cover_exercise_6"]
        case .NETWORKING: return ["img_cover_networking_1", "img_cover_networking_2", "img_cover_networking_3", "img_cover_networking_4", "img_cover_networking_5", "img_cover_networking_6"]
        case .PLAYING: return ["img_cover_play_1", "img_cover_play_2", "img_cover_play_3", "img_cover_play_4", "img_cover_play_5", "img_cover_play_6"]
        case .OTHERS: return ["img_cover_others_1", "img_cover_others_2", "img_cover_others_3", "img_cover_others_4", "img_cover_others_5", "img_cover_others_6"]
        }
    }
}

extension CategoryState {
    func getCoverImage(coverImgIndex: Int) -> String {
        return self.coverImage[coverImgIndex]
    }
}
