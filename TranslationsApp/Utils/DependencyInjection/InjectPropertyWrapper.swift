//
//  InjectPropertyWrapper.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 27.04.2022..
//

import Foundation

@propertyWrapper
struct Inject<Service> {
    var service: Service
    
    init() {
        guard let service = DependencyContainer.resolve(Service.self) else {
            fatalError("No service of type \(String(describing: Service.self)) registered!")
        }
        
        self.service = service
    }
    
    var wrappedValue: Service {
        self.service
    }
}
