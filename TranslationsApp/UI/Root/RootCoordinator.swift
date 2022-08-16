//
//  RootCoordinator.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 19.04.2022..
//

import SwiftUI

final class RootCoordinator: ObservableObject {
    
    @Published var onboardingViewModel: OnboardingViewModel?
    @Published var loginViewModel: LoginViewModel?
    @Published var mainCoordinator: MainCoordinator?
    
    @Inject var persistenceService: PersistenceServiceProtocol
    
    init() {
        if persistenceService.didShowOnboarding {
            goToLogin()
        } else {
            goToOnboarding()
        }
    }
    
    func goToOnboarding() {
        onboardingViewModel = OnboardingViewModel()
        loginViewModel = nil
        mainCoordinator = nil
        
        onboardingViewModel!.onGoToLogin = { [weak self] in
            self?.goToLogin()
        }
    }
    
    func goToLogin() {
        loginViewModel = LoginViewModel()
        onboardingViewModel = nil
        mainCoordinator = nil
        
        loginViewModel!.onGoToHome = { [weak self] in
            self?.goToMain()
        }
    }
    
    func goToMain() {
        mainCoordinator = MainCoordinator()
        onboardingViewModel = nil
        loginViewModel = nil
        
        mainCoordinator!.onSignOut = { [weak self] in
            self?.goToLogin()
        }
    }
}


/*
 
 Lol sto ne rai koji vrag. MMMMMniiice
 Ti si malo građanin znašššš
 
 Tko je taj
 
 Jel pkfj efmefmfe kf efoko
 
 fjeofj
 
 
 
 */

struct RootCoordinatorView: View {
    
    @ObservedObject var coordinator: RootCoordinator
    
    var body: some View {
        NavigationView {
            if let viewModel = coordinator.onboardingViewModel {
                OnboardingScreen(viewModel: viewModel)
            } else if let viewModel = coordinator.loginViewModel {
                LoginScreen(viewModel: viewModel)
            } else if let coordinator = coordinator.mainCoordinator {
                MainCooordinatorView(mainCoordinatoor: coordinator)
            } else {
                DevErrorView(message: "RootCoordinatorView state")
            }
        }
        .navigationViewStyle(.stack)
    }
}
