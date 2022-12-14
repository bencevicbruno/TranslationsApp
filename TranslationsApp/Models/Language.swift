//
//  Language.swift
//  TranslationsApp
//
//  Created by Bruno BenΔeviΔ on 19.04.2022..
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
            return "π¬π§"
        case .german:
            return "π©πͺ"
        case .spanish:
            return "πͺπΈ"
        case .french:
            return "π«π·"
        case .croatian:
            return "π­π·"
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
