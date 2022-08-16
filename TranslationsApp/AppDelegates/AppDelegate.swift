//
//  AppDelegate.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 19.04.2022..
//

import Foundation
import SwiftUI
import GoogleSignIn

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        DependencyContainer.register(type: PersistenceServiceProtocol.self, PersistenceService())
        DependencyContainer.register(type: GoogleAuthServiceProtocol.self, GoogleAuthService())
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
