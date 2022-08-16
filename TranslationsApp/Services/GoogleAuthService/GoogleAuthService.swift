//
//  GoogleAuthService.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 29.04.2022..
//

import Foundation
import UIKit
import GoogleSignIn

class GoogleAuthService: GoogleAuthServiceProtocol {
    
    private static let clientID = "310715453094-ceoet89ub9i2uunc3una3uuul76elq1j.apps.googleusercontent.com"
    
    init() {
        
    }
    
    var configuration: GIDConfiguration {
        GIDConfiguration(clientID: Self.clientID)
    }
    
    func login(completion: @escaping (String) -> Void) {
        guard let topViewController = UIApplication.topViewController else {
            print("topviewcontroller is nil")
            return
        }
        
        
        let config = GIDConfiguration(clientID: Self.clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: topViewController) { [weak self] user, error in
            if let error = error {
                print("sign in error")
                print(error)
            } else {
                guard let user = user else {
                    print("user is nil after signin")
                    return
                }
                
                let authentication = user.authentication
//                let idToken = authentication.idToken
                
                let accessToken = authentication.accessToken
                
                print("authenticated, access token: \(accessToken)")
                
                completion(accessToken)
            }
            
        }
    }
}
