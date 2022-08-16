//
//  OnboardingViewModel.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 19.04.2022..
//

import Foundation
import SwiftUI

final class OnboardingViewModel: ObservableObject {
    
    @Published var step: OnboardingItem = .welcome
    
    var onGoToLogin: EmptyCallback?
    
    init() {
        
    }
    
    func nextTapped() {
        guard let nextStep = step.next else {
            onGoToLogin?()
            return
        }
        
        withAnimation {
            step = nextStep
        }
    }
    
    var isLastStep: Bool {
        step == .letsgo
    }
}
