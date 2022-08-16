//
//  CurrentUser.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 29.04.2022..
//

import Foundation

struct User: Codable {
    let name: String
    let avatarURL: String
    let grantedScopes: [GoogleAuthScope]
}
