//
//  GoogleSignInService.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 13.04.2022..
//

import Foundation
import GoogleSignIn

class GoogleSignInService: NSObject {
    
    static let kYourClientNumer = "310715453094-ceoet89ub9i2uunc3una3uuul76elq1j.apps.googleusercontent.com"
    let kIssuer = "https://accounts.google.com"
    let kClientID = "310715453094-ceoet89ub9i2uunc3una3uuul76elq1j.apps.googleusercontent.com"
    let kClientSecret = "REPLACE_BY_YOUR_CLIENT_SECRET"
    let kRedirectURI = "com.googleusercontent.apps.\(kYourClientNumer):/oauthredirect"
    let kExampleAuthorizerKey = "REPLACE_BY_YOUR_AUTHORIZATION_KEY"
    // The rest omitted
    
    func login(completion: @escaping (String) -> Void) {
        
        
        
        let config = GIDConfiguration(clientID: kClientID)
        
        guard let topViewController = UIApplication.topViewController else {
            print("topviewcontroller is nil")
            return
        }
        
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
