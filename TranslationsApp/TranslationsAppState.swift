//
//  TranslationsAppState.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 02.05.2022..
//

import Foundation

struct AppError: Identifiable {
    let id = UUID()
    let title: String
    let message: String?
}

class TranslationsAppState: ObservableObject {
    
    @Published var error: AppError?
    
    static var showError: ((AppError) -> Void)?
    
    init() {
        Self.showError = { [weak self] error in
            self?.error = error
        }
    }
}
