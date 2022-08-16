//
//  GoogleAuthScope.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 29.04.2022..
//

import Foundation

struct GoogleAuthScope: Codable {
    let url: String
    
    private init(_ scope: String) {
        self.url = "https://www.googleapis.com/auth/\(scope)"
    }
    
    static let DRIVE_READONLY = GoogleAuthScope("drive.readonly")
    static let SPREADSHEETS = GoogleAuthScope("spreadsheets")
}
