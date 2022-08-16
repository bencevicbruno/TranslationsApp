//
//  LoginViewModel.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 19.04.2022..
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    var onGoToHome: EmptyCallback?
    
    @Inject var googleAuthService: GoogleAuthServiceProtocol
    
    init() {
        
    }
    
    func loginTapped() {
        print("Logging in")
        
        onGoToHome?()
//        onGoToHome?()
    }
}
