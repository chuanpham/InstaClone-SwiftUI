//
//  User.swift
//  InstagramClone
//
//  Created by chuanpham on 10/04/2024.
//

import Foundation

struct User: Codable {
    var uid: String
    var email: String
    var profileImageUrl: String
    var username: String
    var bio: String
    var keywords: [String]
}

