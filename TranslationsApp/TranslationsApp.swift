//
//  TranslationsApp.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 13.04.2022..
//

import SwiftUI

@main
struct TranslationsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var appState = TranslationsAppState()
    
    let signinService = GoogleSignInService()
    let spreadSheetService = SpreadsheetService()
    @State var accessToken = ""
    
    var body: some Scene {
        WindowGroup {
            RootCoordinatorView(coordinator: RootCoordinator())
                .overlay(Text(appState.error?.title ?? "No error"))
        }
    }
}
