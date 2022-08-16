//
//  PersistenceService.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 27.04.2022..
//

import Foundation

class PersistenceService: PersistenceServiceProtocol {
    
    fileprivate var userDefaults = UserDefaults.standard
    
    init() {
        
    }
    
    var didShowOnboarding: Bool {
        get {
            true//userDefaults.get(.didShowOnboarding) ?? false
        } set {
            userDefaults.set(.didShowOnboarding, newValue)
        }
    }
}
