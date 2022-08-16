//
//  Translation.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 19.04.2022..
//

import Foundation

struct Translation: Identifiable {
    var key: String
    var translations: [Language: String] = [:]
    
    var id: String {
        key
    }
    
    var allTranslations: [Dictionary<Language, String>.Element] {
        translations.sorted(by: <)
    }
}
