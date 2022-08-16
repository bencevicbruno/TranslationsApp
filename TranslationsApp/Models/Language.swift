//
//  Language.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 19.04.2022..
//

import Foundation

enum Language {
    case english
    case german
    case spanish
    case french
    case croatian
    
    var title: String {
        return "\(self)".capitalized
    }
    
    var flag: String {
        switch self {
        case .english:
            return "🇬🇧"
        case .german:
            return "🇩🇪"
        case .spanish:
            return "🇪🇸"
        case .french:
            return "🇫🇷"
        case .croatian:
            return "🇭🇷"
        }
    }
}

extension Language: Identifiable {
    
    var id: Self { self }
}

extension Language: Comparable {
    
    static func <(lhs: Language, rhs: Language) -> Bool {
        return "\(lhs)" < "\(rhs)"
    }
}
