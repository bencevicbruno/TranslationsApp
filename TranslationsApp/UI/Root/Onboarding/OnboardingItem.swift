//
//  OnboardingItem.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 19.04.2022..
//

import Foundation

enum OnboardingItem: Identifiable, CaseIterable, Hashable {
    case welcome
    case about
    case signin
    case usage
    case letsgo
    
    var id: Self {
        self
    }
    
    var index: Int {
        Self.allCases.firstIndex(of: self) ?? -1
    }
    
    var next: Self? {
        self == .letsgo ? nil : Self.allCases[index + 1]
    }
    
    var title: String {
        "Step #\(index + 1)"
    }
    
    var description: String {
        "Description lorem ipsum #\(index + 1)"
    }
    
    var systemImageName: String {
        "\(index + 1).square"
    }
}
