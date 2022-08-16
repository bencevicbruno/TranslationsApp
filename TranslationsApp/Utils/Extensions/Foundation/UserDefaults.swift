//
//  UserDefaults.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 27.04.2022..
//

import Foundation

extension UserDefaults {
    
    func get<T>(_ key: PersistenceDataKey) -> T? where T: Decodable {
        guard let data = self.data(forKey: "\(key)") else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    func set<T>(_ key: PersistenceDataKey, _ t: T) where T: Encodable {
        guard let data = try? JSONEncoder().encode(t) else { return }
        self.setValue(data, forKeyPath: "\(key)")
    }
}
