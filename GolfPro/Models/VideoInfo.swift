//
//  VideoInfo.swift
//  GolfPro
//
//  Created by tsthcmusit on 11/3/18.
//  Copyright © 2018 tsthcmusit. All rights reserved.
//

import Foundation

struct SwingVideo {
    var id: Int
    var videoPath: String
    var videoComparePath: String
    var thumbnailPath: String
    var dateTimeInterval: String
    var golfClub: String
    var ownerId: String
    var ownerName: String
    var hasVoice: Bool
    var isFavorited: Bool
    var isPosted: Bool
    var isPrepare: Bool
    var hasTrim: Bool
    var hasSlowMotion: Bool
    var isReview: Bool
    var videoType: VideoType
}

enum VideoType {
    case master
    case user
    case review
}
