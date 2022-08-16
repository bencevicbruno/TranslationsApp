//
//  OnboardingScreen.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 19.04.2022..
//

import SwiftUI

struct OnboardingScreen: View {
    
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            TabView(selection: $viewModel.step) {
                ForEach(OnboardingItem.allCases) { item in
                    itemCard(for: item)
                        .tag(item)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .transition(.slide)
            .frame(size: 300)
            
            Button {
                viewModel.nextTapped()
            } label: {
                Text(viewModel.isLastStep ? "Let's go" : "Next")
                    .font(.system(size: 26))
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .background(Color.accentColor)
                    )
            }
        }
    }
    
    private func itemCard(for item: OnboardingItem) -> some View {
        VStack {
            Image(systemName: item.systemImageName)
                .resizable()
                .scaledToFit()
                .frame(minSize: 50, maxSize: 100)
                .foregroundColor(.accentColor)
                .padding()
            
            VStack {
                Text(item.title)
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Text(item.description)
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white.opacity(0.1))
            )
        }
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen(viewModel: OnboardingViewModel())
    }
}
