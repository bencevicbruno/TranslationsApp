//
//  MainCoordinator.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 29.04.2022..
//

import Foundation
import SwiftUI

class MainCoordinator: ObservableObject {
    
    var onSignOut: EmptyCallback?
    
    init() {
        
    }
}

struct MainCooordinatorView: View {
    
    @ObservedObject var mainCoordinatoor: MainCoordinator
    
    var body: some View {
        Button("Sign out") {
            mainCoordinatoor.onSignOut?()
        }
    }
}
