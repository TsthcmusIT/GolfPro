//
//  UserProfile.swift
//  GolfPro
//
//  Created by tsthcmusit on 11/5/18.
//  Copyright © 2018 tsthcmusit. All rights reserved.
//

import Foundation

struct UserProfile {
    let id: String
    var email: String
    var password: String
    var gender: String
    var city: String
    var country: String
    var avatarPath: String
    var fullName: String
    var userType: String
    var birthday: String
    var allowNotification: Bool
    var allowUpdate: Bool
    var status: Bool
    var numLike: Int
    var numFavorited: Int
    var numVideoPublic: Int
}
